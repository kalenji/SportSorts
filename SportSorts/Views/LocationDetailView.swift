//
//  LocationDetailView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 26.01.23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    @StateObject private var commentViewModel = CommentViewModel()
    
    let location: Location
    @State private var comment = ""
    @State private var locationComments: [String] = []

    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    map
                    Divider()
                    commentSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .overlay(backButton, alignment: .topLeading)

    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var map: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }

    private var commentSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Comments")
                .font(.title2)
                .fontWeight(.semibold)
            ForEach(locationComments, id: \.self) { comment in
                Text(comment)
                    .font(.body)
            }
            HStack(spacing: 16) {
                TextField("Enter your comment", text: $comment)
                    .padding()
                Button("Submit") {
                    commentViewModel.addComment(comment, to: location.id)
                    locationComments.append(comment)
                    comment = ""
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}
