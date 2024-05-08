//
//  WeatherClient.swift
//  Weather App
//
//  Created by Jason Fang on 5/8/24.
//

import Foundation

struct WeatherClient {
    func fetchWeather(location: Location) async throws -> Weather {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .weatherByLatLon(location.lat, location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
    }
}
