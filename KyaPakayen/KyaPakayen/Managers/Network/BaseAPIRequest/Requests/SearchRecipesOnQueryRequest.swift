//
//  RecipeSearchQueryRequest.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation
struct SearchRecipesOnQueryRequest: APIRequest {
    let query: String
    let number: Int
    let offset: Int
}
