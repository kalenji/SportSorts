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
    
    init(comments: [Comment]) {
        self.comments = comments
        let db = Firestore.firestore()
        db.collection("Comments").addSnapshotListener {(snap, error) in
            if error != nil {
                print("Error")
                return
            }
            for i in snap!.documentChanges {
                //let documentID = i.document.documentID
                let dbCommentText = i.document.get("commentText") as! String
                DispatchQueue.main.async {
                    self.comments.append(Comment(text: dbCommentText))
                }
            }
        }
    }
}
