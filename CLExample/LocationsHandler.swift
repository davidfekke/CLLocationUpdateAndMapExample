//
//  ContentViewModel.swift
//  CLExample
//
//  Created by David Fekke on 9/17/23.
//

import Foundation
import CoreLocation

@MainActor 
class LocationsHandler: ObservableObject {
    static let shared = LocationsHandler()  // Create a single, shared instance of the object.

    private let manager: CLLocationManager
    private var background: CLBackgroundActivitySession?

    @Published var lastLocation = CLLocation()
    @Published var count = 0
    @Published var isStationary = false

    @Published
    var updatesStarted: Bool = UserDefaults.standard.bool(forKey: "liveUpdatesStarted") {
        didSet { UserDefaults.standard.set(updatesStarted, forKey: "liveUpdatesStarted") }
    }
    
    @Published
    var backgroundActivity: Bool = UserDefaults.standard.bool(forKey: "BGActivitySessionStarted") {
        didSet {
            backgroundActivity ? self.background = CLBackgroundActivitySession() : self.background?.invalidate()
            UserDefaults.standard.set(backgroundActivity, forKey: "BGActivitySessionStarted")
        }
    }
    
    private init() {
        self.manager = CLLocationManager()

    }
    
    func startLocationUpdates() {
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
        Task() {
            do {
                self.updatesStarted = true
                let updates = CLLocationUpdate.liveUpdates(.default)
                for try await update in updates {
                    if !self.updatesStarted { break }  // End location updates by breaking out of the loop.
                    if let loc = update.location {
                        self.lastLocation = loc
                        self.isStationary = update.isStationary
                        self.count += 1
                    }
                }
            } catch {
                print("Could not start location updates")
            }
            return
        }
    }
    
    func stopLocationUpdates() {
        print("Stopping location updates")
        self.updatesStarted = false
    }
}
