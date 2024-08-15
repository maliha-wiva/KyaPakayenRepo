//
//  NetworkManager.swift
//  KyaPakaye
//
//  Created by Maliha on 19.07.2024.
//

import Foundation
import UIKit

class NetworkManager {
    private let apiKey = SpoonacularCredentials().ApiKey
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    private  init(){
        
    }
    
    func fetchRecipes(completed: @escaping(Result<[Recipe], KPError>)-> Void) {
        let urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do{
                ///the following line is just for displaing in console
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print(json)
                }
                
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(RecipeResponse.self, from: data)
                completed(.success(decodedResponse.results))
            }
            catch{
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
    func downloadImage(fromUrlString urlString: String, completed: @escaping(UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
            task.resume()
    }
    
}
