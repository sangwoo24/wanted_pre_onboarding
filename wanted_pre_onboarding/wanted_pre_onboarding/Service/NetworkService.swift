//
//  NetworkService.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import Foundation

class NetworkService {
    private let API_KEY_WEATHER = "25364466d5ba5b4956350f7b3fed5dfb"
    
    static let shared = NetworkService()
    
    private init() {
        // init
    }
    
    func getWeatherData(lat: Double, lon: Double, units: String = "metric", completionHandler: @escaping (WeatherResponse?) -> (Void)){
        
        let session = URLSession(configuration: .default)
        guard let requestURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=\(units)&appid=\(API_KEY_WEATHER)") else { return }
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200..<300).contains(statusCode),
                  let resultData = data,
                  error == nil else {
                completionHandler(nil)
                return
            }
            let response = WeatherResponse.parseWeatherResponse(data: resultData)
            completionHandler(response)
        }
        dataTask.resume()
    }
}
