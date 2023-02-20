//
//  LocationDetailView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 26.01.23.
//

import SwiftUI
import MapKit
import FirebaseFirestore

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    @StateObject private var commentsVM = CommentsViewModel(locationID: "")

    
    @State private var commentText: String = ""

    
    let location: Location
    
    init(location: Location) {
        self.location = location
        _commentsVM = StateObject(wrappedValue: CommentsViewModel(locationID: location.id)) // Initialize CommentsViewModel with locationID
    }

    
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
            
            Text(location.workingTime)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .bold()
            
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
        VStack(alignment: .leading, spacing: 8) {
            Text("Comments")
                .font(.title3)
                .fontWeight(.semibold)
            
            TextField("Write a comment...", text: $commentText)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
            
            Button("Post") {
                saveComment()
            }
            Text("Comments")
                .font(.headline)
            ForEach(commentsVM.comments, id: \.self) { comment in
                CommentView(comment: comment)
            }
        }
    }
    func saveComment() {
        let db = Firestore.firestore()
        db.collection("Comments").document().setData(["commentText":commentText, "locationID": location.id])
    }
}
