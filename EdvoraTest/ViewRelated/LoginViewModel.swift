//
//  LoginViewModel.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {

    @Published var username = "" {
        didSet {
            print(username)
        }
    }

    @Published var password = "" {
        didSet {
            print(password)
        }
    }

    @Published var email = "" {
        didSet {
            print(email)
        }
    }

    func usernameOnChangeValidation(newValue: String) -> String {
        let updatedString = newValue.lowercased()
        return updatedString.replacingOccurrences(of: " ", with: "")
    }

}
