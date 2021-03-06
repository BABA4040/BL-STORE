//
//  LoginViewModel.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import SwiftUI
import Combine

/// Login view model protocol
///
protocol LoginViewModelProtocol {
    func doLoginValidation() -> Bool
    func usernameValidation() -> Bool
    func passwordValidation() -> Bool
    func emailValidation() -> Bool
}

final class LoginViewModel: LoginViewModelProtocol, ObservableObject {

    @Published var username = String()
    @Published var password = String()
    @Published var email = String()
    @Published var isInputsNotValid = false
    @Published var validationMessage = String()
    @Published var validationTitle = String()

    /// Check all validations on button click
    ///
    func doLoginValidation() -> Bool {
        if usernameValidation() {
            if passwordValidation() {
                if emailValidation() {
                    isInputsNotValid = false
                    validationMessage = String()
                    clearCreds()
                    return true
                }
            }
        }
        isInputsNotValid = true
        return false
    }

    /// Username validation
    /// Username must be 4 chars long
    ///
    func usernameValidation() -> Bool {
        if username.trimWhiteSpace().count < 4 {
            validationTitle = Localisation.usernameValidationTitle
            validationMessage = Localisation.usernameValidationMessage
            return false
        }
        return true
    }

    /// Password validation
    ///
    func passwordValidation() -> Bool {
        let validationModel = Validations(value: password)
        let status = validationModel.validatePassword()
        if !status {
            validationTitle = Localisation.passwordValidationTitle
            validationMessage = Localisation.passwordValidationMessage
        }
        return status
    }

    /// Email validation
    ///
    func emailValidation() -> Bool {
        let validationModel = Validations(value: email)
        let status = validationModel.validateEmail()
        if !status {
            validationTitle = Localisation.emailValidationTitle
            validationMessage = ""
        }
        return status
    }

    /// Clear entered credentials
    ///
    private func clearCreds() {
        username = ""
        password = ""
        email = ""
    }

}

// MARK: - Localisation

private extension Localisation {
    static let usernameValidationTitle = NSLocalizedString("Enter a valid username!", comment: "Title for username alert")
    static let usernameValidationMessage = NSLocalizedString("Username should have atleast 4 characters long"
                                                             + "\nand"
                                                             + "\nshould not have spaces and no upper case alphabet",
                                                             comment: "Warning message for username validation")

    static let passwordValidationTitle = NSLocalizedString("Enter a valid password!", comment: "Title for password alert")
    static let passwordValidationMessage = NSLocalizedString("Password should have atleast 8 characters,"
                                                             + "\n1 number, 1 upper case alphabet"
                                                             + "\nand 1 lower case alphabet"
                                                             , comment: "Warning message for password validation")

    static let emailValidationTitle = NSLocalizedString("Enter a valid email!", comment: "Title for email alert")
}
