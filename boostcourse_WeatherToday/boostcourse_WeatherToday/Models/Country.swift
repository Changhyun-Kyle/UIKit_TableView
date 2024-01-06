//
//  Country.swift
//  boostcourse_WeatherToday
//
//  Created by 강창현 on 1/3/24.
//

import Foundation

struct Country: Codable {
    let name: String
    let assetData: String
    
    var flagImage: String {
        return "flag_\(assetData)"
    }
    enum CodingKeys: String, CodingKey {
        case name = "korean_name"
        case assetData = "asset_name"
    }
}
