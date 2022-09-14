//
//  Measurement.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/14.
//

import Foundation
import UIKit

struct Measurement {
    var type: MeasurementType
    var value: Int
}

enum MeasurementType {
    case feelingTemp
    case minTemp
    case maxTemp
    case humidity
    case pressure
    case windSpeed
    
    func getTypeIconName() -> String {
        switch self {
        case .feelingTemp:
            return "icon_feeling_temp"
        case .minTemp:
            return "icon_min_temp"
        case .maxTemp:
            return "icon_max_temp"
        case .humidity:
            return "icon_humidity"
        case .pressure:
            return "icon_pressure"
        case .windSpeed:
            return "icon_wind_speed"
        }
    }
    
    func getValueString(_ value: Int) -> String {
        switch self {
        case .feelingTemp, .minTemp, .maxTemp:
            return "\(value)°C"
        case .humidity:
            return "\(value)%"
        case .pressure:
            return "\(value)hPa"
        case .windSpeed:
            return "\(value) km/h"
        }
    }
    
    func getDetailInfo() -> String {
        return ""
        switch self {
        case .feelingTemp:
            return "FELLING TEMP"
        case .minTemp:
            return "MIN TEMP"
        case .maxTemp:
            return "MAX TEMP"
        case .humidity:
            return "HUMIDITY"
        case .pressure:
            return "PRESSURE"
        case .windSpeed:
            return "SPEED"
        }
    }
}
