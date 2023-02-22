//
//  CommentViewModel.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 18.02.23.
//


import Foundation
import FirebaseFirestore
import Firebase

class CommentsViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    let locationID: String // Add locationID property
    
    init(locationID: String) {
        self.locationID = locationID // Initialize locationID
        
        let db = Firestore.firestore()
        db.collection("Comments")
            .whereField("locationID", isEqualTo: locationID) // Listen for comments associated with the current location
            .addSnapshotListener { (snap, error) in
                if error != nil {
                    print("Error")
                    return
                }
                for i in snap!.documentChanges {
                    let dbCommentText = i.document.get("commentText") as! String
                    DispatchQueue.main.async {
                        self.comments.append(Comment(text: dbCommentText, locationID: self.locationID))
                    }
                }
            }
    }
}
