//
//  Weather.swift
//  Weather App
//
//  Created by Jason Fang on 5/8/24.
//

import Foundation


struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable{
    let temp: Double
}
