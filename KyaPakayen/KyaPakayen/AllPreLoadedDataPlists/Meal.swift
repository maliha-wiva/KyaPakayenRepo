//
//  MealType.swift
//  KyaPakayen
//
//  Created by Maliha on 23.07.2024.
//

import Foundation
struct Meal: Codable{
    let title : String
    let value : String
    let icon : String
}

struct MealType: Codable {
    let mealTypes: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case mealTypes = "MealType"
    }
}

