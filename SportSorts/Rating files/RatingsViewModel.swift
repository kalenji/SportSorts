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
    @Published var averageRating: Double = 0.0
    let locationID: String
    
    init(locationID: String) {
        self.locationID = locationID
        
        let db = Firestore.firestore()
        db.collection("Ratings")
            .whereField("locationID", isEqualTo: locationID)
            .addSnapshotListener { (snap, error) in
                if error != nil {
                    print("Error")
                    return
                }
                
                var totalRating = 0.0
                var count = 0
                for i in snap!.documentChanges {
                    let dbRating = i.document.get("rating") as! Double
                    totalRating += dbRating
                    count += 1
                    DispatchQueue.main.async {
                        self.ratings.append(Rating(locationID: self.locationID, ratingValue: dbRating))
                    }
                }
                if count > 0 {
                    self.averageRating = totalRating / Double(count)
                } else {
                    self.averageRating = 0.0
                }
            }
    }
}
