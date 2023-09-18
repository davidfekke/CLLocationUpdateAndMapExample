//
//  MapLocationWidget.swift
//  CLExample
//
//  Created by David Fekke on 9/18/23.
//

import SwiftUI
import MapKit

struct MapLocationWidget: View {
    let location: CLLocationCoordinate2D
    var body: some View {
        Map {
            Marker("GPS Location", coordinate: location)
        }
    }
}

#Preview {
    MapLocationWidget(location: .jaxbeach)
}
