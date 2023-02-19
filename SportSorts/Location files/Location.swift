//
//  Location.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 21.01.23.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String {
        name + cityName
    }
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let workingTime: String
    let imageNames: [String]
    let link: String
}
