//
//  ContentView.swift
//  Gitpractice
//
//  Created by Maliha on 08.07.2024.
//

import SwiftUI

/// Onboarding main view where all the view hai residing
struct OnboardingMainView: View {
    
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
            
        var body: some View {
            TabView(selection: $selectedTab) {
                WelcomViewOnboarding()
                    .tag(0)
                ExploreRecipiesViewOnboarding()
                    .tag(1)
                PersonalizationViewOnboarding()
                    .tag(2)
                AddToFavouriteViewOnboarding()
                    .tag(3)
                GetStartToCookViewOnboarding()
                    .tag(4)
                
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(.linearGradient(colors: [.red, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    OnboardingMainView()
}
struct WelcomViewOnboarding: View {
    var body: some View {
        VStack {
            Image(systemName: "fork.knife")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Welcome")
                .font(.largeTitle)
                .padding()
            Text("Welcome to Kya Pkaey! Discover and cook your favorite recipes.")
                .multilineTextAlignment(.center)
                .padding()
        }
        
    }
}

struct ExploreRecipiesViewOnboarding: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Explore Recipes")
                .font(.largeTitle)
                .padding()
            Text("Discover a wide variety of recipes from Asian, Pakistani, Indian, and more cuisines.")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
struct PersonalizationViewOnboarding: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Personalization")
                .font(.largeTitle)
                .padding()
            Text("Set your preferences to get personalized recipe recommendations.")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct AddToFavouriteViewOnboarding: View {
    var body: some View {
        
        VStack {
            Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Favorites and Collections")
                .font(.largeTitle)
                .padding()
            Text("Save your favorite recipes and organize them into collections.")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct GetStartToCookViewOnboarding: View {
    @EnvironmentObject var appState: AppState
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
            Button{
                appState.hasCompletedOnboarding = true
            }label: {
                Text("Start Cooking")
                    .font(.headline)
                    .padding()
                    .background(LinearGradient(colors: [.blue, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .frame(width: 300, height: 55)
        }
    }
}
