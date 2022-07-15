//
//  HomeView.swift
//  EdvoraTest
//
//  Created by Anas P on 20/11/21.
//

import SwiftUI

/// Home View
/// This page will be shown after successfull login
///
struct HomeView: View {

    @State private var createExamTaped: Bool = false
    @Binding var isLoggedOut: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                //=== Header View ===//
                HeaderView()

                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
            .edgesIgnoringSafeArea(.all)
        }
    }

    /// Header view
    ///
    @ViewBuilder private func HeaderView() -> some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello Anas")
                        .font(.system(size: 28))
                    Text("Welcome to your **Dashboard**")
                        .font(.system(size: 14))
                }
                .textStyle()

                Spacer()

                NavigationLink(isActive: $createExamTaped) {
                    CreateExamView(createExamTaped: $createExamTaped)
                } label: {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .frame(height: 200)
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
