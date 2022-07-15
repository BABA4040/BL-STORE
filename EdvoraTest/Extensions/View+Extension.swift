//
//  View+Extension.swift
//  EdvoraTest
//
//  Created by Anas P on 13/12/21.
//

import Foundation
import SwiftUI

extension View {
    /// Layers the given views behind this `TextEditor`.
    /// 
    func textEditorBackground<V>(@ViewBuilder _ content: () -> V) -> some View where V : View {
        self
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }
            .background(content())
    }
}
