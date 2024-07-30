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
    @State private var selectedTab = 4
            
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
        .background(Color.background)
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
        ZStack{
            VStack {
                HStack{
                    Image("cutlery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("Kya Pakaeyen")
                }.padding(.bottom, 80)
                    .offset(x:-10)
                Image("start_chef")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("Let's Cook")
                    .font(.largeTitle)
                    .padding()
                Text("Something Yummmy!!!")
                    .font(.headline)
                Text("Something Yum!!!")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                
                HStack{
                    Button{
                        appState.hasCompletedOnboarding = true
                    }label: {
                        Text("Start Cooking")
                            .font(.headline)
                    }
                    Image(systemName: "arrow.right")
                }
                .padding()
                .background(AppColors.primaryColor)
                .foregroundColor(AppColors.textColor)
                .cornerRadius(10)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}
