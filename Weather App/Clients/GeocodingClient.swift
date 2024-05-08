//
//  GeocodingClient.swift
//  Weather App
//
//  Created by Jason Fang on 5/8/24.
//

import Foundation

enum NetworkErrors: Error {
    case invalidResponse
}


struct GeocodingClient {
    func coordinateByCity(_ city:String) async throws -> Location?{
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
        
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
    }
}
