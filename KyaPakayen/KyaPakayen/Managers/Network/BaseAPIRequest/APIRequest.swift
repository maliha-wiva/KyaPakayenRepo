//
//  APIRequest.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation
protocol APIRequest {
    func toParameters() -> [String: Any]
}

extension APIRequest {
    func toParameters() -> [String: Any] {
        var params: [String: Any] = [:]
        let mirror = Mirror(reflecting: self)
        
        for child in mirror.children {
            if let key = child.label {
                params[key] = child.value
            }
        }
        
        return params
    }
}

