//
//  Friend.swift
//  MyFriends
//
//  Created by 강창현 on 1/3/24.
//

import Foundation

struct Friend: Codable {
    let name: String
    let age: Int
    let addressInfo: Address
    
    var nameAndAge: String {
        return name + "\(age)"
    }
    
    var fullAddress: String {
        return addressInfo.city + ", " + addressInfo.country
    }
    
    enum CodingKeys: String, CodingKey {
        case name, age
        case addressInfo = "address_info"
    }
}

struct Address: Codable {
    let country: String
    let city: String
}

