//
//  WeatherDetailModel.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/14.
//

import Foundation

struct WeatherDetail {
    var iconUrl: String
    var description: String
    var location: String
    var currentTemp: Double
    var mesurements: [Measurement]
    
    static func fromWeatherResponse(_ weatherResponse: WeatherResponse) -> WeatherDetail {
        var measurements: [Measurement] = []
        measurements.append(Measurement(type: .feelingTemp, value: (Int(round(weatherResponse.main.feelingTemp)))))
        measurements.append(Measurement(type: .maxTemp, value: (Int(round(weatherResponse.main.maxTemp)))))
        measurements.append(Measurement(type: .minTemp, value: (Int(round(weatherResponse.main.minTemp)))))
        measurements.append(Measurement(type: .humidity, value: weatherResponse.main.humidity))
        measurements.append(Measurement(type: .pressure, value: (Int(round(weatherResponse.main.pressure)))))
        measurements.append(Measurement(type: .windSpeed, value: (Int(round(weatherResponse.wind.speed)))))
        
        return WeatherDetail(
            iconUrl: weatherResponse.weather.first?.icon ?? "",
            description: weatherResponse.weather.first?.description ?? "",
            location: weatherResponse.name,
            currentTemp: weatherResponse.main.temp,
            mesurements: measurements
        )
    }
}

