//
//  ValidationProtocol.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import Foundation

/// To confirm all type of validations
///
protocol ValidationProtocol {

    /// The string to be validated
    /// 
    var validationString: String? { get }

    /// To validate Username
    ///
    func validateUsername() -> Bool

    /// To validate Password
    ///
    func validatePassword() -> Bool

    /// To validate Email
    ///
    func validateEmail() -> Bool
}

