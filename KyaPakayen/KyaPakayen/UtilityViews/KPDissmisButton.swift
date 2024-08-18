//
//  APDissmisButton.swift
//  AppetizerApp
//
//  Created by Maliha on 26.06.2024.
//

import SwiftUI

struct KPDissmisButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.medium)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    KPDissmisButton()
}
