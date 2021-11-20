//
//  HomeView.swift
//  EdvoraTest
//
//  Created by Anas P on 20/11/21.
//

import SwiftUI

/// Home View
/// This page will show after successfull login
///
struct HomeView: View {

    @Binding var isLoggedOut: Bool

    var body: some View {
        VStack(spacing: 20) {

            Spacer()

            Group {
                Text("😎")
                    .font(.system(size: 60))
                Text("Successfully logged in")
                    .font(.system(size: 30))
            }

            Spacer()

            //=== Logout button ===//
            Button {
                isLoggedOut.toggle()
            } label: {
                Text(Localisation.logout)
                    .frame(maxWidth: .infinity)
                    .frame(width: 200, height: 52)
            }
            .buttonStyle(EdvoraButtonStyle())

            Spacer()
                .frame(height: 50)
        }
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isLoggedOut: .constant(false))
    }
}

// MARK: - Localisation

private extension Localisation {
    static let logout = NSLocalizedString("LOGOUT", comment: "Title for logout button")
}
