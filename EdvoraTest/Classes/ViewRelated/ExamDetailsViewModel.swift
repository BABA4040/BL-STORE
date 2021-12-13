//
//  ExamDetailsViewModel.swift
//  EdvoraTest
//
//  Created by Anas P on 11/12/21.
//

import Foundation
import SwiftUI

final class ExamDetailsViewModel: ObservableObject {
    @Published var instruction = String()
    @Published var sectionTitle = String()
    @Published var sectionDescription = "Section description (Optional)"

}

