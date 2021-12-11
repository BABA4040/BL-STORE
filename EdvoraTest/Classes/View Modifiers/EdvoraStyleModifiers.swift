//
//  EdvoraStyleModifiers.swift
//  EdvoraTest
//
//  Created by Anas P on 10/12/21.
//

import Foundation
import SwiftUI

/// Text style with app accent color
///
struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
    }
}

// MARK: View extensions
extension View {
    func textStyle() -> some View {
        self.modifier(TextStyle())
    }
}
