//
//  ContentView.swift
//  Weather App
//
//  Created by Jason Fang on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    @State private var weather: Weather?
    
    private func fetchWeather() async {
        do{
            guard let location = try await geocodingClient.coordinateByCity(city) else {return}
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
           TextField("Type City Name ...", text:  $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather{
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            if let weather{
                Text("\(weather.temp)")
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
