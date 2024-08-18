//
//  CustomModifiers.swift
//  AppetizerApp
//
//  Created by Maliha on 29.06.2024.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier{
    
    func body(content: Content) -> some View { content
        .buttonStyle(.bordered)
        .tint(.myPrimary)
        .controlSize(.large)
        
    }
}
