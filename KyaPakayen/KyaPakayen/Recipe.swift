//
//  Recipe.swift
//  KyaPakaye
//
//  Created by Maliha on 19.07.2024.
//

import Foundation
import Foundation

struct Recipe: Identifiable, Codable {
    let id: Int
    let title: String
    let image: String
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.image, forKey: .image)
    }
}

struct RecipeResponse: Codable {
    let results: [Recipe]
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.results, forKey: .results)
    }
}
