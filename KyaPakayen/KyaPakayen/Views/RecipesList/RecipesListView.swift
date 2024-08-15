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
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeRowView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
            .onAppear {
                viewModel.fetchRecipes()
            }
        }
    }
}



struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            if let imageUrl = URL(string: recipe.image) {
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



