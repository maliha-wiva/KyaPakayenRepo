//
//  NetworkManager.swift
//  KyaPakaye
//
//  Created by Maliha on 19.07.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = SpoonacularCredentials().ApiKey
    
    func fetchRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print(json)
                }
                
                let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                completion(.success(decodedResponse.results))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
