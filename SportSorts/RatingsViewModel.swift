//
//  RatingsViewModel.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 21.02.23.
//

import Foundation
import FirebaseFirestore
import Firebase

class RatingsViewModel: ObservableObject {
    @Published var ratings: [Rating] = []
    let locationID: String // Add locationID property
    
    init(locationID: String) {
        self.locationID = locationID // Initialize locationID
        
        let db = Firestore.firestore()
        db.collection("Ratings")
            .whereField("locationID", isEqualTo: locationID) // Listen for comments associated with the current location
            .addSnapshotListener { (snap, error) in
                if error != nil {
                    print("Error")
                    return
                }
                for i in snap!.documentChanges {
                    let dbRating = i.document.get("rating") as! Double
                    DispatchQueue.main.async {
                        self.ratings.append(Rating(locationID: self.locationID, ratingValue: dbRating))
                    }
                }
            }
    }
}
