//
//  Endpoint.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation

/// This is the ENUM for descriping the request method type that can be
/// GET: get should be used when we want to get the information from the server
/// POST: will be used when we need to put some data on server and want to save like in my app if i want to save recipe on server then i will use this method
/// PUT: when i need to update the data
/// DELETE: when i need to delete the data from the server through API
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var body: Data? { get }
    var urlRequest: URLRequest { get }
}

extension Endpoint {
    var urlRequest: URLRequest {
        var url = URL(string: SpoonacularCredentials().BaseURL)!
        url.appendPathComponent(path)
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters?.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        var request = URLRequest(url: components?.url ?? url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
}

enum SpoonacularEndpoint: Endpoint {
    
    case searchRecipes(SearchRecipesOnQueryRequest)
    case searchRecipesOnParam(SearchRecipesOnParamRequest)
    case recipeDetail(RecipeDetailRequest)
        
        var path: String {
            switch self {
            case .searchRecipes:
                return "/recipes/complexSearch"
            case .recipeDetail(let request):
                return "/recipes/\(request.id)/information"
            case .searchRecipesOnParam:
                return "/recipes/complexSearch"
            }
        }
        
        var method: HTTPMethod {
            return .get
        }
        
        var headers: [String : String]? {
            return ["Content-Type": "application/json", "x-api-key": SpoonacularCredentials().ApiKey]
        }
        
        var parameters: [String: Any]? {
            switch self {
            case .searchRecipes(let request):
                return request.toParameters()
            case .recipeDetail:
                return nil
            case .searchRecipesOnParam(let request):
                return request.toParameters()
            }
        }
    
    var body: Data? {
            return nil
        }
    
}
