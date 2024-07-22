//
//  CuisinesView.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import SwiftUI
enum Cuisine: String, CaseIterable, Identifiable {
    case italian    = "italian"
    case chinese    = "chinese"
    case indian     = "indian"
    case mexican    = "mexican"
    case american   = "american"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.capitalized
    }
}
struct CuisinesSelectionView: View {
    
    @State private var selectedCuisine: Cuisine? = nil
    var selectedMealType: MealType? = nil
    
    var body: some View {
        NavigationView{
            VStack{
                List(Cuisine.allCases) { cuisine in
                    HStack {
                        Text(cuisine.displayName)
                            .foregroundColor(self.selectedCuisine == cuisine ? .blue : .primary)
                        Spacer()
                        if self.selectedCuisine == cuisine {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedCuisine = cuisine
                    }
                }
                .navigationTitle("Select Cuisine")
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: IngrediantsSelectionView()) {
//                        Text("Next")
//                            .disabled(selectedMealType == nil && selectedCuisine == nil)
//                    }
//                }
//            }
        }
    }
}

#Preview {
    CuisinesSelectionView()
}
