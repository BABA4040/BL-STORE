//
//  ButtonStyles.swift
//  EdvoraTest
//
//  Created by Anas P on 20/11/21.
//

import SwiftUI

/// Button Style: Brown filled - White text
/// 
struct FilledBrown: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(.white)
            .background(Color.ui.darkBrown)
            .font(.system(size: 20, weight: .regular))
            .cornerRadius(13)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut, value: 0.2)
    }
}

/// Button Style: Light brown filled - Brown Text
///
struct BrownText: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .font(.system(size: 16))
            .foregroundColor(Color.ui.darkBrown)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(Color.ui.darkBrown.opacity(0.2))
            .cornerRadius(10)
            .padding([.leading, .trailing], 20)
    }
}
