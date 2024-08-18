//
//  NetworkLogger.swift
//  KyaPakayen
//
//  Created by Maliha on 17.08.2024.
//

import Foundation

// MARK: - NetworkLogger
class NetworkLogger {
    static func log(request: URLRequest) {
        print("\n- - - - - - - - - - OUTGOING REQUEST - - - - - - - - - -\n")
        defer { print("\n- - - - - - - - - - END REQUEST - - - - - - - - - -\n") }
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = URLComponents(string: urlAsString)

        let method = request.httpMethod ?? ""
        let path = urlComponents?.path ?? ""
        let query = urlComponents?.query ?? ""
        let host = urlComponents?.host ?? ""

        var logOutput = """
        \(urlAsString) \n\n
        \(method) \(path)?\(query) HTTP/1.1 \n
        HOST: \(host)\n
        """

        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }

        if let body = request.httpBody {
            logOutput += "\n\(String(data: body, encoding: .utf8) ?? "")"
        }

        print(logOutput)
    }

    static func log(response: URLResponse, data: Data?) {
        print("\n- - - - - - - - - - INCOMING RESPONSE - - - - - - - - - -\n")
        defer { print("\n- - - - - - - - - - END RESPONSE - - - - - - - - - -\n") }

        let urlAsString = response.url?.absoluteString ?? ""
        let httpResponse = response as? HTTPURLResponse

        var logOutput = """
        \(urlAsString) \n\n
        HTTP \(httpResponse?.statusCode ?? 0)\n
        """

        httpResponse?.allHeaderFields.forEach { key, value in
            logOutput += "\(key): \(value) \n"
        }

        if let data = data {
            logOutput += "\n\(String(data: data, encoding: .utf8) ?? "")"
        }

        print(logOutput)
    }
}
