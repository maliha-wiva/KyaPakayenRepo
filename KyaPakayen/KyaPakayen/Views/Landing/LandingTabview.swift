//
//  LandingTabview.swift
//  Gitpractice
//
//  Created by Maliha on 10.07.2024.
//

import SwiftUI

struct LandingTabview: View {
    var body: some View {
        TabView{
            RecipesListView()
                .onAppear(){
//                    let meals = PropertyListManager.loadMealTypes(from: "MealTypes")
//                    print(meals ?? "Maliha")
                }
            .tabItem {
                Label("List", systemImage: "fork.knife")
                    
            }
            RecipiesView()
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
                    
            }
            RecipiesView()
                .tabItem {
                    Label("Account", systemImage: "person")
                        
            }
        }
    }
}

struct RecipiesView: View {
    var body: some View {
       
        VStack {
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Get Cooking")
                .font(.largeTitle)
                .padding()
            Text("Let’s get started! Find your first recipe now.")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}


#Preview {
    LandingTabview()
}
