//
//  MapView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 20.01.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var searchText = ""
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    var body: some View {
        NavigationView{
            ZStack {
                
                map
                
                VStack(spacing: 0) {
                    header
                        .padding()
                    
                    Spacer()
                    
                    locationsPreviewStack
                }
            }
            .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
                LocationDetailView(location: location)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


extension MapView {
    private var header: some View {
        NavigationStack{
            List(searchResults){
                locationSingle in Button(action: {vm.mapLocation=locationSingle}) {
                    Text(locationSingle.name)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 30)
                        .frame(maxWidth: .infinity )
                        .animation(.none, value: vm.mapLocation)
                }

            }
            .listStyle(PlainListStyle())

        }
        .searchable(text: $searchText)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        .frame(height:200,alignment: .topLeading)
    }
    
    private var map: some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
    
    private var searchResults: [Location]{
        if searchText.isEmpty{
            return LocationsDataService.locations
        }
        else{
            return LocationsDataService.locations.filter{$0.name.contains(searchText)}
        }
        }
}
