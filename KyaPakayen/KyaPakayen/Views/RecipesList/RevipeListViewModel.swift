//
//  RevipeListViewModel.swift
//  KyaPakayen
//
//  Created by Maliha on 01.08.2024.
//

import Foundation

final class RecipeListViewModel: ObservableObject{
    
    @Published var isShowingDetailView =  false
    @Published var selectedRecipe :  RecipeSummary?
    @Published var recipes: [RecipeSummary] = []
    @Published var isLoading = false
    @Published var alletitem : KPAlertItem?
    private let networkManager = NetworkManager.shared
    
    init() {
        searchRecipes(query: "tomato")
    }
    
    func searchRecipes(query: String, intolerances: [String]? = nil, mealType: String? = nil, cuisine: String? = nil) {
        isLoading = true
        
        let request = SearchRecipesOnParamRequest(query: "Tomato and potatos", intolerances: ["gluten"], mealType: "pakistani", cuisine: "breakfast")
//        let request = SearchRecipesOnQueryRequest(query: "Tomato and potatos")
        APIService.shared.searchRecipesWithMore(request: request) { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.recipes = recipes.results
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    switch error {
                    case .invalidData:
                        self?.alletitem = KPAlertContext.invalidData
                    case .invalidURL:
                        self?.alletitem = KPAlertContext.invalidURL
                    case .invalidResponse:
                        self?.alletitem = KPAlertContext.invalidResponse
                    case .decodingError(_):
                        self?.alletitem = KPAlertContext.decodingError
                    case .serverError(statusCode: let statusCode):
                        self?.alletitem = KPAlertContext.serverError
                    case .clientError(statusCode: let statusCode):
                        self?.alletitem = KPAlertContext.clientError
                    case .unknownError(_):
                        self?.alletitem = KPAlertContext.unknownError
                    case .networkError(_):
                        self?.alletitem = KPAlertContext.networkError
                    }
                }
            }
        }
    }
    
    func getRecipeDetail(recipe: RecipeSummary) {
        isLoading = true
        let request = RecipeDetailRequest(id: recipe.id)
        APIService.shared.fetchRecipeDetail(request: request) { [weak self] result in
            switch result {
            case .success(let recipeDetail):
                DispatchQueue.main.async {
                    self?.isLoading = false
                    print(recipeDetail)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    switch error {
                    case .invalidData:
                        self?.alletitem = KPAlertContext.invalidData
                    case .invalidURL:
                        self?.alletitem = KPAlertContext.invalidURL
                    case .invalidResponse:
                        self?.alletitem = KPAlertContext.invalidResponse
                    case .decodingError(_):
                        self?.alletitem = KPAlertContext.decodingError
                    case .serverError(statusCode: let statusCode):
                        print("Error code is \(statusCode)")
                        self?.alletitem = KPAlertContext.serverError
                    case .clientError(statusCode: let statusCode):
                        print("Error code is \(statusCode)")
                        self?.alletitem = KPAlertContext.clientError
                    case .unknownError(_):
                        self?.alletitem = KPAlertContext.unknownError
                    case .networkError(_):
                        self?.alletitem = KPAlertContext.networkError
                    }
                }
            }
        }
    }
//    func searchRecipes(query: String, intolerances: [String]? = nil, mealType: String? = nil, cuisine: String? = nil) {
//            APIService.shared.searchRecipes(query: query, intolerances: intolerances, mealType: mealType, cuisine: cuisine) { [weak self] result in
//                switch result {
//                case .success(let recipes):
//                    DispatchQueue.main.async {
//                        self?.recipes = recipes.results
//                    }
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        self?.errorMessage = error.localizedDescription
//                    }
//                }
//            }
//        }
//    func fetchRecipes() {
//        isLoading = true
        
//        networkManager.fetchRecipes { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case .success(let recipes):
//                    self?.recipes = recipes
//                    self?.displayRecipies(recipes)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    switch error {
//                    case .invalidData:
//                        self?.alletitem = KPAlertContext.invalidData
//                    case .invalidURL:
//                        self?.alletitem = KPAlertContext.invalidURL
//                    case .invalidResponse:
//                        self?.alletitem = KPAlertContext.invalidResponse
//                    case .unableToComplete:
//                        self?.alletitem = KPAlertContext.invalidToComplete
//                    }
//                }
//            }
//        }
//    }
    
}
