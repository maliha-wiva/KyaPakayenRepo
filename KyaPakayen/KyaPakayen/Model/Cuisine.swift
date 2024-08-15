//
//  Cuisine.swift
//  KyaPakayen
//
//  Created by Maliha on 23.07.2024.
//

import Foundation
struct Cuisine: Codable {
    let value: String
    let title: String
    let icon: String
}

struct CuisineTypeContainer: Codable {
    let cuisineType: [Cuisine]
    
    enum CodingKeys: String, CodingKey {
        case cuisineType = "CuisineType"
    }
}
