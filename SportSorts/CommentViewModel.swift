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
    
    func addComment(_ comment: Comment) {
        comments.append(comment)
    }
}
