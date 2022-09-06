//
//  WeatherInfo.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import Foundation

struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    
    static func parseWeatherResponse(data: Data) -> WeatherResponse? {
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode(WeatherResponse.self, from: data)
            return response
        } catch let error {
            print("--> error: \(error.localizedDescription)")
            return nil
        }
    }
    
    struct Main: Codable {
        let temp: Double
        let feelingTemp: Double
        let minTemp: Double
        let maxTemp: Double
        let pressure: Double
        let humidity: Int
        
        private enum CodingKeys: String, CodingKey {
            case temp
            case feelingTemp = "feels_like"
            case minTemp = "temp_min"
            case maxTemp = "temp_max"
            case pressure
            case humidity
        }
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Double
        let gust: Double?
    }

    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}


