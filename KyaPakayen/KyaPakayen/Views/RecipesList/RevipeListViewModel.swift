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
    private var currentPage = 0
    private var isLastPage = false
    private var totalResults = 0
    private let pageSize = 10 // Number of recipes per page
    
    init() {
//        searchRecipes(query: "potatos and tomatos", intolerances: ["gluten"], mealType: "Breakfast", cuisine: "Asian")
    }
    
    func searchRecipes(query: String, intolerances: [String]? = nil, mealType: String? = nil, cuisine: String? = nil) {
            guard !isLastPage else { return } // Stop if we've loaded all pages
            
            isLoading = true
            let offset = currentPage * pageSize
            
            let request = SearchRecipesOnParamRequest(
                query: query,
                intolerances: intolerances,
                mealType: mealType,
                cuisine: cuisine,
                number: pageSize,
                offset: offset
            )
            
            APIService.shared.searchRecipesWithMore(request: request) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.recipes.append(contentsOf: response.results)
                        self.totalResults = response.totalResults
                        
                        if response.results.count < self.pageSize ||
                           self.recipes.count >= self.totalResults {
                            self.isLastPage = true
                        } else {
                            self.currentPage += 1
                            // Recursively call searchRecipes to fetch the next page
                            self.searchRecipes(query: query, intolerances: intolerances, mealType: mealType, cuisine: cuisine)
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.handleAPIError(error)
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
                    self?.handleAPIError(error)
                }
            }
        }
    }
    
    private func handleAPIError(_ error: NetworkError) {
            print(error.localizedDescription)
            switch error {
            case .invalidData:
                self.alletitem = KPAlertContext.invalidData
            case .invalidURL:
                self.alletitem = KPAlertContext.invalidURL
            case .invalidResponse:
                self.alletitem = KPAlertContext.invalidResponse
            case .decodingError(_):
                self.alletitem = KPAlertContext.decodingError
            case .serverError(let statusCode):
                print("Error code is \(statusCode)")
                self.alletitem = KPAlertContext.serverError
            case .clientError(let statusCode):
                print("Error code is \(statusCode)")
                self.alletitem = KPAlertContext.clientError
            case .unknownError(_):
                self.alletitem = KPAlertContext.unknownError
            case .networkError(_):
                self.alletitem = KPAlertContext.networkError
            }
        }
}
