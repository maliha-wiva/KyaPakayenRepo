//
//  MealTypeView.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import SwiftUI


enum MealType: String, CaseIterable, Identifiable {
    case breakfast = "breakfast"
    case lunch = "lunch"
    case dinner = "dinner"
    case snacks = "snacks"
    case desserts = "desserts"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.capitalized
    }
}




struct MealTypeSelectionView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MealTypeSelectionView()
}
