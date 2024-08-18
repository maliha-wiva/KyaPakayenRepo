//
//  RecipeSearchParamRequest.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation

struct SearchRecipesOnParamRequest: APIRequest {
    let query: String
    let intolerances: [String]?
    let mealType: String?
    let cuisine: String?
}
