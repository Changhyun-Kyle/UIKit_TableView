//
//  Weather.swift
//  boostcourse_WeatherToday
//
//  Created by 강창현 on 1/3/24.
//

import Foundation

struct Weather: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Double
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}
