//
//  EdvoraButtonStyle.swift
//  EdvoraTest
//
//  Created by Anas P on 20/11/21.
//

import SwiftUI

/// Customised button style for the app
/// 
struct EdvoraButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(.white)
            .background(Color("button-brown"))
            .font(.system(size: 20, weight: .regular))
            .cornerRadius(13)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut, value: 0.2)
    }
}
