//
//  Location.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 21.01.23.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
