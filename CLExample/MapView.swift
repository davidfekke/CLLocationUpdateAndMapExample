//
//  MapView.swift
//  CLExample
//
//  Created by David Fekke on 9/17/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let jaxbeach = CLLocationCoordinate2D(latitude: 30.2563349, longitude: -81.3815)
}

struct MapView: View {
    var body: some View {
        Map() {
            Marker("JAX Beach", coordinate: .jaxbeach)
            UserAnnotation()
        }
        .mapStyle(.standard(elevation: .realistic))
        .navigationTitle("JAX Beach")
    }
}

#Preview {
    MapView()
}
