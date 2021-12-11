//
//  CreateExamViewModel.swift
//  EdvoraTest
//
//  Created by Anas P on 11/12/21.
//

import Foundation
import SwiftUI

final class CreateExamViewModel: ObservableObject {
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

}
