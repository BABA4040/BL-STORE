//
//  QuestionChoicesView.swift
//  EdvoraTest
//
//  Created by Anas P on 13/12/21.
//

import SwiftUI

struct QuestionChoicesView: View {

    @ObservedObject var viewModel = QuestionChoicesViewModel()

    var body: some View {
        VStack(alignment:.leading) {
            //=== Question ===//
            TextField("Add question here", text: $viewModel.question)
                .font(.system(size: 16))
                .foregroundColor(Color.ui.darkBrown)
                .padding([.leading, .top], 20)

            Divider()
                .padding([.leading, .trailing], 20)

            //=== Options ===//
            VStack(alignment: .leading, spacing: 0) {
                ForEach((1...4), id: \.self) { _ in
                    HStack {
                        Button {
                            print("Option Clicked")
                        } label: {
                            Image(systemName: "circle")
                                .imageScale(.large)
                                .padding([.leading, .top, .bottom], 20)
                                .padding(.trailing, 12)
                        }

                        ZStack {
                            RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1)
                                .foregroundColor(Color.ui.darkBrown)
                            HStack {
                                Spacer(minLength: 7)
                                Text("A")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.ui.darkBrown)
                                    .background(Color.ui.lightBackground)
                                    .cornerRadius(3)
                                TextField("Add Option...", text: $viewModel.optionQuestion)
                                    .font(.system(size: 15))
                                    .padding(.trailing, 10)
                            }

                        }
                        .frame(height: 44)

                        Button {
                            print("Option delete clicked")
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.ui.lightBrown)
                                .imageScale(.medium)
                                .padding([.trailing, .top, .bottom], 20)
                                .padding(.leading, 8)
                        }
                    }
                }
            }
        }
    }
}

struct QuestionChoicesView_Preview: PreviewProvider {
    static var previews: some View {
        QuestionChoicesView()
    }
}

final class QuestionChoicesViewModel: ObservableObject {
    @Published var question = String()
    @Published var optionQuestion = String()

}
