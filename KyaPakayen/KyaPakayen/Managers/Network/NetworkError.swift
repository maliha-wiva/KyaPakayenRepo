//
//  NetworkError.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation
// MARK: - NetworkError
enum NetworkError: Error {
    
    case invalidURL
    case invalidData
    case decodingError(Error)
    case serverError(statusCode: Int)
    case clientError(statusCode: Int)
    case unknownError(Error)
    case networkError(Error)
    case invalidResponse
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidData:
            return "No data received from the server."
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .clientError(let statusCode):
            return "Client error with status code: \(statusCode)"
        case .unknownError(let error):
            return "Unknown error occurred: \(error.localizedDescription)"
        case .networkError(let error):
            return "\(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from the server."
        }
    }
}
