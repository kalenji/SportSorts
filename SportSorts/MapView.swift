//
//  MapView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 20.01.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.6977, longitude: 23.3219), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        NavigationView{
            VStack {
                Map(coordinateRegion: $region)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
