//
//  RevipeListViewModel.swift
//  KyaPakayen
//
//  Created by Maliha on 01.08.2024.
//

import Foundation

final class RecipeListViewModel: ObservableObject{
    
    @Published var isShowingDetailView =  false
    @Published var selectedRecipe :  Recipe?
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var alletitem : KPAlertItem?
    private let networkManager = NetworkManager.shared
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        isLoading = true
        networkManager.fetchRecipes { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let recipes):
                    self?.recipes = recipes
                    self?.displayRecipies(recipes)
                case .failure(let error):
                    print(error.localizedDescription)
                    switch error {
                    case .invalidData:
                        self?.alletitem = KPAlertContext.invalidData
                    case .invalidURL:
                        self?.alletitem = KPAlertContext.invalidURL
                    case .invalidResponse:
                        self?.alletitem = KPAlertContext.invalidResponse
                    case .unableToComplete:
                        self?.alletitem = KPAlertContext.invalidToComplete
                    }
                }
            }
        }
    }
    
    private func displayRecipies(_ recipes: [Recipe]) {
        for recipe in recipes {
            
            print(recipe)
            
        }
    }
    
}
