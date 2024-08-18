//
//  NetworkManager.swift
//  KyaPakaye
//
//  Created by Maliha on 19.07.2024.
//

import Foundation
import UIKit



final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    private init() {}
    
    
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        NetworkLogger.log(request: endpoint.urlRequest) // This is a logger for printing th erequest
        let urlRequest = endpoint.urlRequest
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
                        
            NetworkLogger.log(response: httpResponse, data: data)
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                                    print(json)
                                }
                
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingError(error)))
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
