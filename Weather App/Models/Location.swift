//
//  Location.swift
//  Weather App
//
//  Created by Jason Fang on 5/8/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
