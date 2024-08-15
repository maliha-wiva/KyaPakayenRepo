//
//  Alerts.swift
//  KyaPakayen
//
//  Created by Maliha on 02.08.2024.
//

import Foundation
import SwiftUI
struct KPAlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct KPAlertContext {

    // Network Alerts
    static let invalidData = KPAlertItem(title: Text("Server Error"),
                                              message: Text("The data received from the server is invalid. Please contact support"),
                                              dismissButton: .default(Text("OK")))
    static let invalidURL = KPAlertItem(title: Text("URL Error"),
                                       message: Text("The URL is not valid invalid. Please contact support"),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidResponse = KPAlertItem(title: Text("Server Error"),
                                           message: Text("The response  received from the server is invalid. Please contact support"),
                                              dismissButton: .default(Text("OK")))
    
    
    static let invalidToComplete = KPAlertItem(title: Text("Server Error"),
                                             message: Text("Please check your inernet connection. Please contact support"),
                                              dismissButton: .default(Text("OK")))
    

}
