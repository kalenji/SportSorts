//
//  Comment.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 18.02.23.

import Foundation
import FirebaseFirestore

struct Comment: Identifiable, Hashable {
    let id = UUID()
    let text: String
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
}

class FirebaseManager {
    static let shared = FirebaseManager()
    private let db = Firestore.firestore()
    
    func saveComment(_ comment: Comment, for locationID: String) {
        db.collection("locations").document(locationID).collection("comments").addDocument(data: [
            "text": comment.text
        ])
    }
}
