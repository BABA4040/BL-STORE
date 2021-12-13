//
//  CreateExamViewModel.swift
//  EdvoraTest
//
//  Created by Anas P on 11/12/21.
//

import SwiftUI


final class CreateExamViewModel: ObservableObject {

    // MARK: - Variables

    var examID: UUID?

    @Published var selectedClassroom: Classroom?
    @Published var syllabus = String()
    @Published var examDate = Date()
    @Published var examTime = Date()
    @Published var examDurationHour = String()
    @Published var examDurationMinute = String()
    @Published var examTimeframeHour = String()
    @Published var examTimeframeMinute = String()
    @Published var totalMark = String()
    @Published var category = String()

    // MARK: - Validations

    ///
    func doValidation() -> Bool {
        return false
    }

    // MARK: - Storage

    ///
    ///
    func saveExam() {
        guard let classroomID = selectedClassroom?.id else { return }
        let exam = Exam(examID: examID ?? UUID(),
                        classroomID: Int64(classroomID),
                        syllabus: syllabus,
                        date: examDate,
                        time: examTime,
                        duration: "\(examDurationHour):\(examDurationMinute)",
                        timeframe: "\(examTimeframeHour):\(examTimeframeMinute)",
                        totalMarks: totalMark,
                        category: category,
                        sections: createExamSections())
        print(exam)
    }

    ///
    ///
    private func createExamSections() -> [ExamSection] {
        let sections = [ExamSection]()
        return sections
    }

}
