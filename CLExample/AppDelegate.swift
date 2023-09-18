//
//  AppDelegate.swift
//  CLExample
//
//  Created by David Fekke on 9/17/23.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let locationsHandler = LocationsHandler.shared
        
        // If location updates were previously active, restart them after the background launch.
        if locationsHandler.updatesStarted {
            locationsHandler.startLocationUpdates()
        }
        // If a background activity session was previously active, reinstantiate it after the background launch.
        if locationsHandler.backgroundActivity {
            locationsHandler.backgroundActivity = true
        }
        return true
    }
}
