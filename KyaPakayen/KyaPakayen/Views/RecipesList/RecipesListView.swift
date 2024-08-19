//
//  RecipesListView.swift
//  KyaPakayen
//
//  Created by Maliha on 23.07.2024.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else {
                        List(viewModel.recipes) { recipe in
                            RecipeRowView(recipe: recipe)
                                .onTapGesture{
                                    viewModel.selectedRecipe = recipe
                                    viewModel.isShowingDetailView = true
                                    viewModel.getRecipeDetail(recipe: recipe)
                                }
                        }
                    }
                }
                .navigationTitle("Recipes")
                .onAppear {
                    viewModel.searchRecipes(query: "potatos and tomatos", intolerances: ["gluten"], mealType: "Breakfast", cuisine: "pakistani")
                    
                }
            }
        }
        
    }
}



struct RecipeRowView: View {
    let recipe: RecipeSummary
    
    var body: some View {
        HStack {
            if let imageUrl = URL(string: recipe.image ?? "fork") {
                                AsyncImage(url: imageUrl) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                } placeholder: {
                                    ProgressView()
                                }
            }
            Text(recipe.title)
        }
    }
}

#Preview {
    RecipesListView()
}



