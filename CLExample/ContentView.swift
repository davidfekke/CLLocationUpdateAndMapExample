//
//  ContentView.swift
//  CLExample
//
//  Created by David Fekke on 9/17/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationsHandler = LocationsHandler.shared

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Location: \(self.locationsHandler.lastLocation)")
                    .padding(10)
                Text("Count: \(self.locationsHandler.count)")
                MapLocationWidget(location: self.locationsHandler.lastLocation.coordinate)
                Spacer()
                Button(self.locationsHandler.updatesStarted ? "Stop Location Updates" : "Start Location Updates") {
                    self.locationsHandler.updatesStarted ? self.locationsHandler.stopLocationUpdates() : self.locationsHandler.startLocationUpdates()
                }
                .buttonStyle(.bordered)
                Button(self.locationsHandler.backgroundActivity ? "Stop BG Activity Session" : "Start BG Activity Session") {
                    self.locationsHandler.backgroundActivity.toggle()
                }
                .padding(.bottom)
                
                NavigationLink("Show Full Page Map") {
                    MapView()
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
