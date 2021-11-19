//
//  LoginView.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel = LoginViewModel()

    @State private var isUsernameFocused: Bool = false
    @State private var isValidUsername: Bool = false
    @State private var isValidPassword: Bool = false
    @State private var isValidEmail: Bool = false

    var body: some View {

        Spacer(minLength: 60)

        // Edvora logo
        Image(uiImage: UIImage(named: "edvora-logo")!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 156)

        Spacer(minLength: 100)

        // Textfields
        VStack(spacing: 16) {

            // Username field
            EdvoraTextField(title: "Username",
                            image: UIImage(named: "username-icon")!,
                            textContentType: .username,
                            text: $viewModel.username)

            // Password field
            EdvoraTextField(title: "Password",
                            image: UIImage(named: "password-icon")!,
                            textContentType: .password,
                            text: $viewModel.password)

            // Email field
            EdvoraTextField(title: "Email",
                            image: UIImage(named: "email-icon")!,
                            textContentType: .emailAddress,
                            text: $viewModel.email)

            Text(manageErrorMessage())
                .foregroundColor(.red)
        }

        Spacer()
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    func manageErrorMessage() -> String {
        var errorMsg = String()
        if !isValidUsername {
            errorMsg = "Enter a valid username"
        }
        else if !isValidPassword {
            errorMsg = "Enter a valid password\n"
            + "Password should have 8 characters, 1 number, 1 upper case alphabet, 1 lower case alphabet"
        }
        else if !isValidEmail {
            errorMsg = "Enter a valid email"
        }
        return errorMsg
    }
}
