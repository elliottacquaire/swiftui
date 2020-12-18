//
//  MapView.swift
//  Fuck
//
//  Created by Elliott on 2020/12/11.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coodia = CLLocationCoordinate2D(latitude: 32.23424234, longitude: 120.34234234)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let reg = MKCoordinateRegion(center: coodia, span: span)
        uiView.setRegion(reg, animated: true)
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
