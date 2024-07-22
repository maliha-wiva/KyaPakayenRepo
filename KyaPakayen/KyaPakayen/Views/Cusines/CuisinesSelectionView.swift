//
//  CuisinesView.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import SwiftUI
enum Cuisine: String, CaseIterable, Identifiable {
    case italian = "italian"
    case chinese = "chinese"
    case indian = "indian"
    case mexican = "mexican"
    case american = "american"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.capitalized
    }
}
struct CuisinesSelectionView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CuisinesSelectionView()
}
