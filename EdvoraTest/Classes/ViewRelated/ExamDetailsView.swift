//
//  ExamDetailsView.swift
//  EdvoraTest
//
//  Created by Anas P on 10/12/21.
//

import SwiftUI

struct ExamDetailsView: View {

    @Binding var nextTaped: Bool

    var body: some View {
        //=== Header View ===//
        HeaderView()

        ScrollView {
            VStack {
                //=== Header View ===//

                Text("Hello, World!")
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }

    /// Header view
    ///
    @ViewBuilder private func HeaderView() -> some View {
        HStack {
            Button {
                nextTaped.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
            }

            Text(Localisation.createNewExaminationTitle)
                .font(.system(size: 16, weight: .bold))

            Spacer()

            Button {
                print("Save tapped")
            } label: {
                Text(Localisation.saveTitle)
                    .frame(width: 59, height: 34)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                    )
            }
            .textStyle()
        }
        .padding()
    }
}

struct ExamDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamDetailsView(nextTaped: .constant(true))
    }
}

private extension Localisation {
    static let createNewExaminationTitle = NSLocalizedString("Create New Exam", comment: "Navigation title for Create Exam View")
    static let saveTitle = NSLocalizedString("Save", comment: "Save action title")
}
