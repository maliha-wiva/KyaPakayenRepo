//
//  KyaPakayenApp.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import SwiftUI

@main
struct KyaPakayenApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            if appState.hasCompletedOnboarding {
                MealTypeList()
                //LandingTabview()
                    //.environmentObject(appState)
            } else {
                OnboardingMainView()
                    .environmentObject(appState)
            }
        }.environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
    
}

/// to handle application state for just keeping track of the app to show onboarding screens on not
class AppState: ObservableObject {
    @Published var hasCompletedOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(hasCompletedOnboarding, forKey: "hasCompletedOnboarding")
        }
    }
    init() {
        self.hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
    }
}
