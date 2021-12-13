//
//  CreateExamView.swift
//  EdvoraTest
//
//  Created by Anas P on 10/12/21.
//

import SwiftUI
import Combine

/// CreateExamView View
/// This page will show when the user tap on `+` button from dashboard to create/edit new examination
///
struct CreateExamView: View {
    @ObservedObject var viewModel = CreateExamViewModel()

    @State private var nextTaped: Bool = false
    @Binding var createExamTaped: Bool

    var body: some View {
        VStack {
            //=== Header View ===//
            NavigationHeaderView()

            ScrollView {
                //=== Classroom with drop down ===//
                HStack {
                    Text(Localisation.FormTitles.classroomTitle)
                    Spacer()
                    Menu {
                        ForEach(Classroom.allCases) { classroom in
                            Button {
                                viewModel.selectedClassroom = classroom
                            } label: {
                                if classroom == viewModel.selectedClassroom {
                                    Label(classroom.name, systemImage: "checkmark")
                                }
                                else {
                                    Text(classroom.name)
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.selectedClassroom?.name ?? Localisation.FormTitles.selectClassroomPlaceholder)
                                .opacity(viewModel.selectedClassroom?.name == nil ? 0.6 : 1.0)
                            Image(systemName: "chevron.down")
                        }
                    }
                    .inputFieldStyle()
                }


                //=== Syllabus ===//
                HStack {
                    Text(Localisation.FormTitles.syllabusTitle)
                    Spacer()
                    TextField(Localisation.FormTitles.syllabusPlaceholder, text: $viewModel.syllabus)
                        .inputFieldStyle()
                }

                //=== Date & Time ===//
                Group {
                    DatePicker(Localisation.FormTitles.dateTitle, selection: $viewModel.examDate, displayedComponents: .date)
                    DatePicker(Localisation.FormTitles.timeTitle, selection: $viewModel.examTime, displayedComponents: .hourAndMinute)
                }
                .frame(height: 44)

                //=== Duration & Timeframe ===//
                durationOrTimeFrameView(title: Localisation.FormTitles.durationTitle, HR: $viewModel.examDurationHour, MN: $viewModel.examDurationMinute)
                durationOrTimeFrameView(title: Localisation.FormTitles.timeframeTitle, HR: $viewModel.examTimeframeHour, MN: $viewModel.examTimeframeMinute)

                Group {
                    //=== Total Marks ===//
                    HStack {
                        Text(Localisation.FormTitles.totalMarksTitle)
                        Spacer()
                        TextField("", text: $viewModel.totalMark)
                            .frame(width: 116)
                            .inputFieldStyle()
                    }

                    //=== Category ===//
                    HStack {
                        Text(Localisation.FormTitles.categoryTitle)
                        Spacer()
                        TextField(Localisation.FormTitles.categoryPlaceholder, text: $viewModel.category)
                            .inputFieldStyle()
                    }
                }
                .frame(height: 44)
            }
            .padding(20)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }

    }

    /// Navigation Header
    ///
    @ViewBuilder private func NavigationHeaderView() -> some View {
        HStack {
            Button {
                createExamTaped.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
            }

            Text(Localisation.createNewExaminationTitle)
                .font(.system(size: 16, weight: .bold))

            Spacer()

            NavigationLink(isActive: $nextTaped) {
                ExamDetailsView(nextTaped: $nextTaped)
            } label: {
                Text(Localisation.nextTitle)
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

    /// This view use for Duration and Timeframe view
    ///
    @ViewBuilder private func durationOrTimeFrameView(title: String, HR: Binding<String>, MN: Binding<String>) -> some View {
        //=== Duration
        HStack {
            Text(title)
            Spacer()
            HStack {
                Spacer()
                TextField(Localisation.FormTitles.HRtitle, text: HR)
                    .multilineTextAlignment(.center)
                    .frame(width:60, height: 44)

                Rectangle()
                    .fill(Color.accentColor)
                    .frame(width:1, height: 20)
                    .opacity(0.6)

                TextField(Localisation.FormTitles.MNtitle, text: MN)
                    .multilineTextAlignment(.center)
                    .frame(width:60, height: 44)
            }
            .frame(width: 116)
            .inputFieldStyle()
        }
    }
}

struct CreateExamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExamView(createExamTaped: .constant(true))
    }
}

// MARK: - Private Modifiers

/// Modifier for input fields
///
private struct InputFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 44)
            .padding([.leading, .trailing], 10)
            .background(Color(uiColor: .tertiarySystemFill))
            .cornerRadius(5)
    }
}

// MARK: View extensions
private extension View {
    /// Inputfield style
    ///
    func inputFieldStyle() -> some View {
        self.modifier(InputFieldModifier())
    }
}

// MARK: - Localisation
private extension Localisation {
    static let createNewExaminationTitle = NSLocalizedString("Create New Exam", comment: "Navigation title for Create Exam View")
    static let nextTitle = NSLocalizedString("Next", comment: "Next action title")

    enum FormTitles {
        static let classroomTitle = NSLocalizedString("Classroom:", comment: "Title for classroom option")
        static let selectClassroomPlaceholder = NSLocalizedString("Select Classroom", comment: "Placeholder for classroom")
        static let syllabusTitle = NSLocalizedString("Syllabus:", comment: "Title for syllabus option")
        static let syllabusPlaceholder = NSLocalizedString("Enter modules here", comment: "Placeholder text for syllabus textfield")
        static let dateTitle = NSLocalizedString("Date:", comment: "Title for date option")
        static let timeTitle = NSLocalizedString("Time:", comment: "Title for time option")
        static let durationTitle = NSLocalizedString("Duration:", comment: "Title for duration option")
        static let timeframeTitle = NSLocalizedString("Timeframe:", comment: "Title for timeframe option")
        static let totalMarksTitle = NSLocalizedString("Total Marks:", comment: "Title for total marks option")
        static let categoryTitle = NSLocalizedString("Category:", comment: "Title for category option")
        static let categoryPlaceholder = NSLocalizedString("Internal, mock, etc", comment: "Placeholder text for category textfield")
        static let HRtitle = NSLocalizedString("HR", comment: "Title to represent HR (Hours)")
        static let MNtitle = NSLocalizedString("MN", comment: "Title to represent MN (Minutes)")
    }
}
