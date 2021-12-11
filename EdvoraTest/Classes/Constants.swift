//
//  Constants.swift
//  EdvoraTest
//
//  Created by Anas P on 11/12/21.
//

/// Static class rooms for demo purpose
///
enum Classroom: CaseIterable, Identifiable {
    case class_1, class_2, class_3, class_4, class_5

    var id: Int {
        switch self {
        case .class_1: return 1
        case .class_2: return 2
        case .class_3: return 3
        case .class_4: return 4
        case .class_5: return 5
        }
    }

    var name: String {
        switch self {
        case .class_1: return "Class One"
        case .class_2: return "Class Two"
        case .class_3: return "Class Three"
        case .class_4: return "Class Four"
        case .class_5: return "Class Five"
        }
    }
}
