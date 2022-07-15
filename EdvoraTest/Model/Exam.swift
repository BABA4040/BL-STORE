//
//  Exam.swift
//  EdvoraTest
//
//  Created by Anas P on 13/12/21.
//

import Foundation

/// Exam details
///
public struct Exam {

    // Basic Details
    let examID: UUID
    let classroomID: Int64
    let syllabus: String
    let date: Date
    let time: Date
    let duration: String
    let timeframe: String
    let totalMarks: String
    let category: String

    // Section Details
    let sections: [ExamSection]

    public init(examID: UUID,
                classroomID: Int64,
                syllabus: String,
                date: Date,
                time: Date,
                duration: String,
                timeframe: String,
                totalMarks: String,
                category: String,
                sections: [ExamSection]) {
        self.examID = examID
        self.classroomID = classroomID
        self.syllabus = syllabus
        self.date = date
        self.time = time
        self.duration = duration
        self.timeframe = timeframe
        self.totalMarks = totalMarks
        self.category = category
        self.sections = sections
    }
}

/// Exam section details
///
public struct ExamSection {

    // Basic Details
    let sectionID: UUID
    let instruction: String
    let title: String
    let description: String?

    // Question Details
    let questions: [Questions]

    public init(sectionID: UUID,
                instruction: String,
                title: String,
                description: String?,
                questions: [Questions]) {
        self.sectionID = sectionID
        self.instruction = instruction
        self.title = title
        self.description = description
        self.questions = questions
    }
}

/// Questions details
///
public struct Questions {

    let questionID: UUID
    let question: String

    // Answer options
    let options: [Options]

    public init(questionID: UUID,
                question: String,
                options: [Options]) {
        self.questionID = questionID
        self.question = question
        self.options = options
    }
}

/// Option details
/// 
public struct Options {

    let optionID: UUID
    let option: String
    let isAnswer: Bool

    public init(optionID: UUID,
                option: String,
                isAnswer: Bool) {
        self.optionID = optionID
        self.option = option
        self.isAnswer = isAnswer
    }

}
