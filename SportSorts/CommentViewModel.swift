//
//  CommentViewModel.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 18.02.23.
//

import Foundation
import FirebaseFirestore
import Firebase

class CommentViewModel: ObservableObject {
    private let db = Firestore.firestore()
    
    func addComment(_ text: String, to locationID: String) {
        let timestamp = Timestamp(date: Date())
        db.collection("comments").addDocument(data: [
            "text": text,
            "locationID": locationID,
            "timestamp": timestamp
        ]) { error in
            if let error = error {
                print("Error adding comment: \(error)")
            }
        }
    }
    
    func getComments(for locationID: String, completion: @escaping ([Comment]) -> Void) {
        db.collection("comments")
            .whereField("locationID", isEqualTo: locationID)
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting comments: \(error)")
                } else if let snapshot = snapshot {
                    let comments = snapshot.documents.compactMap { document -> Comment? in
                        let data = document.data()
                        guard let text = data["text"] as? String,
                              let timestamp = data["timestamp"] as? Timestamp
                        else {
                            return nil
                        }
                        return Comment(id: document.documentID, name: text, message: text, timestamp: timestamp)
                    }
                    completion(comments)
                }
            }
    }
    
    func fetchComments(for locationID: String, completion: @escaping ([Comment]) -> Void) {
        db.collection("comments")
            .whereField("locationID", isEqualTo: locationID)
            .getDocuments { querySnapshot, error in
                guard let querySnapshot = querySnapshot else {
                    print("Error fetching comments: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                let comments = querySnapshot.documents.compactMap { document -> Comment? in
                    let data = document.data()
                    guard let name = data["name"] as? String,
                          let message = data["text"] as? String,
                          let timestampDate = data["timestamp"] as? Date else {
                        return nil
                    }
                    let id = document.documentID
                    let timestamp = Timestamp(date: timestampDate)
                    return Comment(id: id, name: name, message: message, timestamp: timestamp)
                }
                completion(comments)
            }
    }
}

