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
    
    @State private var locations = [Location]()
    
    
    var body: some View {
        NavigationView{
            ZStack {
                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
                
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: region.center.latitude, longitude: region.center.longitude)
                            locations.append(newLocation)
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.orange.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
