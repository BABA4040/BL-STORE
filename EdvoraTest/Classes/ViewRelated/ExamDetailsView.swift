//
//  ExamDetailsView.swift
//  EdvoraTest
//
//  Created by Anas P on 10/12/21.
//

import SwiftUI

struct ExamDetailsView: View {

    @ObservedObject var viewModel = ExamDetailsViewModel()
    @Binding var nextTaped: Bool

    var body: some View {
        //=== Header View ===//
        NavigationHeaderView()

        ScrollView {
            VStack(alignment: .leading) {
                //=== Instruction ===//
                Text("Add Instructions")
                    .sectionTitleStyle()
                TextField("", text: $viewModel.instruction)
                    .sectionTextfieldStyle()

                //=== Section ===//
                Spacer(minLength: 25)
                Text("Section Name")
                    .sectionTitleStyle()
                TextField("Section title", text: $viewModel.sectionTitle)
                    .sectionTextfieldStyle()
                TextEditor(text: $viewModel.sectionDescription)
                    .textEditorBackground({ EmptyView() })
                    .frame(height: 89, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(
                        viewModel.sectionDescription == "Section description (Optional)" ? Color(uiColor: UIColor.tertiaryLabel) : Color(uiColor: UIColor.label)
                    )
                    .padding()
                    .cornerRadius(5)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(uiColor: .tertiarySystemFill))
                    )
                    .padding([.leading, .trailing], 20)
                    .onTapGesture {
                        clearPlaceholderWhenStartBeginEditing()
                    }

                //=== Question ===//

                //=== Action Buttons ===//

                Spacer(minLength: 25)
                Group {
                    VStack(spacing: 15) {
                        Button("Add Question") {
                            print("hello")
                        }

                        Button("Add Section") {
                            print("hello")
                        }
                    }
                }
                .buttonStyle(BrownText())


            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }

    /// Navigation Header
    ///
    @ViewBuilder private func NavigationHeaderView() -> some View {
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

    /// To clear placeholder text for text editor
    ///
    private func clearPlaceholderWhenStartBeginEditing() {
        if viewModel.sectionDescription == "Section description (Optional)" {
            viewModel.sectionDescription = ""
        }
    }
}

struct ExamDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamDetailsView(nextTaped: .constant(true))
    }
}

// MARK: - Private Modifier

/// Modifier for section title
/// 
private struct SectionTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .foregroundColor(.secondary)
            .padding(.leading, 20)
    }
}

private struct SectionTextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 48)
            .cornerRadius(5)
            .background(
                RoundedRectangle(cornerRadius: 5).fill(Color(uiColor: .tertiarySystemFill))
            )
            .padding([.leading, .trailing], 20)
    }
}

// MARK: View extensions
private extension View {
    /// Section title style
    ///
    func sectionTitleStyle() -> some View {
        self.modifier(SectionTitleModifier())
    }

    /// Section textfield style
    ///
    func sectionTextfieldStyle() -> some View {
        self.modifier(SectionTextfieldModifier())
    }
}

private extension Localisation {
    static let createNewExaminationTitle = NSLocalizedString("Create New Exam", comment: "Navigation title for Create Exam View")
    static let saveTitle = NSLocalizedString("Save", comment: "Save action title")
}
