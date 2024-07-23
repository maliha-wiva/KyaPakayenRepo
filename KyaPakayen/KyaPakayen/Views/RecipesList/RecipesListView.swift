//
//  RecipesListView.swift
//  KyaPakayen
//
//  Created by Maliha on 23.07.2024.
//

import SwiftUI

struct RecipesListView: View {
    var body: some View {
//        if #available(iOS 17.0, *) {
//            ZStack(){
//                Text("Maliha")
//            }
//            .containerRelativeFrame([.horizontal, .vertical])
//            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
//        } else {
            ZStack(){
                Text("Maliha")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
//        }
        
        
    }
}

#Preview {
    RecipesListView()
}
