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
    let locationID: String
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
}