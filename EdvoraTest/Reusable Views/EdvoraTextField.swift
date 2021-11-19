//
//  EdvoraTextField.swift
//  EdvoraTest
//
//  Created by Anas P on 19/11/21.
//

import SwiftUI
import Combine

/// Reusable textfield with `Title`, `Image`
/// It also support border color when focus the text field or entered any text
///
struct EdvoraTextField: View {

    var title: String
    var image: UIImage
    var textContentType: UITextContentType

    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        
        VStack (alignment: .leading) {

            // Title of textfield
            Text(title)
                .foregroundColor(Color.ui.textLightForeground)
                .font(.system(size: 12))
                .padding(.leading, 16)
                .padding(.bottom, -2)

            ZStack {

                // Border of the textfield
                RoundedRectangle(cornerRadius: 10)
                    .stroke((isFocused || text.count > 0) ? Color.ui.borderSelected : Color.ui.borderNormal,
                            lineWidth: 1)

                HStack {

                    Image(uiImage: image)
                        .padding(.leading, 10)

                    // Secure textfield
                    if textContentType == .password {
                        SecureField("", text: $text)
                            .focused($isFocused)
                            .onChange(of: isFocused, perform: { changed in
                                isFocused = changed
                            })
                            .font(.system(size: 17))
                            .frame(height: 52)
                            .disableAutocorrection(true)
                            .textContentType(.password)
                            .keyboardType(setKeyboardType())
                            .autocapitalization(.none)
                    }
                    else {
                        // Textfield
                        TextField("", text: $text)
                            .focused($isFocused)
                            .onChange(of: isFocused, perform: { changed in
                                isFocused = changed
                            })
                            .font(.system(size: 17))
                            .frame(height: 52)
                            .disableAutocorrection(true)
                            .textContentType(textContentType)
                            .keyboardType(setKeyboardType())
                            .autocapitalization(.none)
                    }
                }
            }
        }
        .padding(36)
        .frame(height: 70)
    }
}

extension EdvoraTextField {

    func setKeyboardType() -> UIKeyboardType {
        switch textContentType {
        case .emailAddress: return .emailAddress
        default:
            return .default
        }
    }

}


