//
//  Recipe.swift
//  KyaPakaye
//
//  Created by Maliha on 19.07.2024.
//

import Foundation
import Foundation

//struct Recipe: Identifiable, Codable {
//    let id: Int
//    let title: String
//    let image: String
////    let ingredients: [Ingredient]
////    let instructions: [Instruction]
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.title, forKey: .title)
//        try container.encode(self.image, forKey: .image)
//    }
//    
////    enum CodingKeys: String, CodingKey {
////        case id, title, image
////        case ingredients = "extendedIngredients"
////        case instructions = "analyzedInstructions"
////    }
//}
//
//struct RecipeResponse: Codable {
//    let results: [Recipe]
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.results, forKey: .results)
//    }
//}

// MARK: - Recipe Model
struct Ingredient: Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
}

struct Instruction: Codable {
    let name: String
    let steps: [Step]
}

struct Step: Codable {
    let number: Int
    let step: String
}
