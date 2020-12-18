//
//  MapViews.swift
//  Fuck
//
//  Created by Elliott on 2020/12/10.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI
import MapKit


struct MapViews: View {
    
    @State private var region = MKCoordinateRegion(
           center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
           span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
       )
    
    var body: some View {
//         MKMapView(coordinateRegion: $region)
        Text("ssss").background(Color.green)
    }
}

struct MapViews_Previews: PreviewProvider {
    static var previews: some View {
        MapViews()
    }
}
