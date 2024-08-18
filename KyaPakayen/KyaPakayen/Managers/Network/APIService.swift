//
//  APIService.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation
final class APIService {
    static let shared = APIService()
    private init() {}
    
    func searchRecipesWithQuery(request: SearchRecipesOnQueryRequest, completion: @escaping (Result<RecipeSearchResult, NetworkError>) -> Void) {
            let endpoint = SpoonacularEndpoint.searchRecipes(request)
            NetworkManager.shared.request(endpoint, completion: completion)
        }
    func searchRecipesWithMore(request: SearchRecipesOnParamRequest, completion: @escaping (Result<RecipeSearchResult, NetworkError>) -> Void) {
            let endpoint = SpoonacularEndpoint.searchRecipesOnParam(request)
            NetworkManager.shared.request(endpoint, completion: completion)
        }
        
        func fetchRecipeDetail(request: RecipeDetailRequest, completion: @escaping (Result<RecipeDetail, NetworkError>) -> Void) {
            let endpoint = SpoonacularEndpoint.recipeDetail(request)
            NetworkManager.shared.request(endpoint, completion: completion)
        }
}
