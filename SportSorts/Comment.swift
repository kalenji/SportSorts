//
//  Comment.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 18.02.23.
//

import Foundation
import FirebaseFirestore

struct Comment: Identifiable, Codable {
    var id: String?
    var name: String
    var message: String
    var timestamp: Timestamp

    enum CodingKeys: String, CodingKey {
        case id, name, message, timestamp
    }

    init(id: String?, name: String, message: String, timestamp: Timestamp) {
        self.id = id
        self.name = name
        self.message = message
        self.timestamp = timestamp
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        message = try container.decode(String.self, forKey: .message)
        let timestampDate = try container.decode(Date.self, forKey: .timestamp)
        timestamp = Timestamp(date: timestampDate)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(message, forKey: .message)
        try container.encode(timestamp.dateValue(), forKey: .timestamp)
    }
}
