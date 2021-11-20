//
//  Validations.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import Foundation

/// All type of validations
/// 
enum ValidationType: Hashable {
    case username
    case password
    case email
}

/// Class use to do all kind of validations
///
struct Validations {

    // Value to be validated
    var validationString: String?

    init(value: String?) {
        self.validationString = value
    }
}

// MARK: - ValidationProtocol
extension Validations: ValidationProtocol {

    /// Username validation
    ///
    func validateUsername() -> Bool {
        guard let username = validationString else { return false }
        if username.count > 3 {
            return true
        }
        else {
            return false
        }
    }

    /// Password validation
    /// should have 8 characters, 1 number, 1 upper case alphabet, 1 lower case alphabet
    func validatePassword() -> Bool {
        guard let password = validationString else { return false }
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }

    /// Email validation
    ///
    func validateEmail() -> Bool {
        guard let email = validationString else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}
