//
//  Validations.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import Foundation

/// All type of validations
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
    ///
    func validatePassword() -> Bool {
        return true
    }

    /// Email validation
    ///
    func validateEmail() -> Bool {
        guard let email = validationString else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
