//
//  RecipesListView.swift
//  KyaPakayen
//
//  Created by Maliha on 23.07.2024.
//

import SwiftUI

struct RecipesListView: View {
    var body: some View {
        let names = ["Holly", "Josh", "Rhonda", "Ted"]
        @State  var searchText = ""
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
        .searchable(text: $searchText){
            ForEach(searchResults, id: \.self) { result in
                Text("Are you looking for \(result)?").searchCompletion(result)
            }
        }
        
        var searchResults: [String] {
            if searchText.isEmpty {
                return names
            } else {
                return names.filter { $0.contains(searchText) }
            }
        }
    }
}

#Preview {
    RecipesListView()
}


//        ZStack(){
//            Text("Lets Cook Something Delicious")
//            Text("Lets Cook Something Delicious")
//            Text("Lets Cook Something Delicious")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
