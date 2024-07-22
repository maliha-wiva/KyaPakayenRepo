//
//  MealTypeView.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import SwiftUI

enum MealType: String, CaseIterable, Identifiable {
    case breakfast  = "breakfast"
    case lunch      = "lunch"
    case dinner     = "dinner"
    case snacks     = "snacks"
    case desserts   = "desserts"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.capitalized
    }
}

struct MealTypeSelectionView: View {
    @State private var selectedMealType: MealType? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                List(MealType.allCases) { mealType in
                    HStack {
                        Text(mealType.displayName)
                            .foregroundColor(self.selectedMealType == mealType ? .blue : .primary)
                        Spacer()
                        if self.selectedMealType == mealType {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedMealType = mealType
                    }
                }
                .navigationTitle("Select Meal Type")
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: CuisinesSelectionView(selectedMealType: selectedMealType)) {
//                        Text("Next")
//                            .disabled(selectedMealType == nil)
//                    }
//                }
//            }
        }
    }
}

#Preview {
    MealTypeSelectionView()
}
