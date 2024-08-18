//
//  SearchRecipeResponse.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation
// MARK: - RecipeSearchResult Model
struct RecipeSearchResult: Codable {
    
    let results: [RecipeSummary]
    let offset: Int
    let number: Int
    let totalResults: Int
}

struct RecipeSummary: Identifiable, Codable {
    let id: Int
    let title: String
    let image: String?
}
