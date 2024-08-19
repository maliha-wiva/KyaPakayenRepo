//
//  RecipeDetailResponse.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation
// MARK: - RecipeDetail
struct RecipeDetail: Decodable {
    let id: Int
    let title: String
    let image: String?
    let servings: Int
    let readyInMinutes: Int
    let instructions : String
//    let nutrition: Nutrition?
    let summary : String?
    let healthScore : Int?
    let analyzedInstructions: [AnalyzedInstructions]
    let extendedIngredients: [Ingredient]
    
    
    struct Ingredient: Codable {
        let id: Int
        let name: String?
        let amount: Double?
        let unit: String?
        let originalString: String?
        let original : String?// The original description of the ingredient
        
    }
    
    // Nested struct for instructions
    struct AnalyzedInstructions: Decodable {
        let steps: [Step]
        let name: String
    }
    struct Step: Codable {
        let number: Int
        let step: String
    }

    struct Nutrition: Codable {
        let calories: String
        let fat: String
        let carbs: String
        let protein: String
    }
}
