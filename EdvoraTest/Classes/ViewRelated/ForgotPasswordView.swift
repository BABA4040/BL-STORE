//
//  ForgotPasswordView.swift
//  EdvoraTest
//
//  Created by Anas P on 20/11/21.
//

import SwiftUI

/// Forgot Password View
/// This page will show when user tap `Forgotten Password` button from login
///
struct ForgotPasswordView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("📩")
                .font(.system(size: 60))

            Text(Localisation.forgotPasswordTitle)
                .font(.system(size: 30))
        }
        .navigationTitle(Localisation.forgotPasswordTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

// MARK: - Localisation

private extension Localisation {
    static let forgotPasswordTitle = NSLocalizedString("Forgot Password", comment: "Navigation title for forgot password view")
}
