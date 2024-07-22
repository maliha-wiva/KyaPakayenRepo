//
//  KyaPakayenApp.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import SwiftUI

@main
struct KyaPakayenApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            GeneralStartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
}
