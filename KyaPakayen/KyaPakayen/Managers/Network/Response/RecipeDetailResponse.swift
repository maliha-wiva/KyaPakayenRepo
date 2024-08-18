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
    let ingredients: [Ingredient]
    let instructions: [Instruction]
    
    // Nested struct for ingredients
    struct Ingredient: Decodable {
        let id: Int
        let name: String
        let amount: Double
        let unit: String
    }
    
    // Nested struct for instructions
    struct Instruction: Decodable {
        let step: Int
        let instruction: String
    }
}
