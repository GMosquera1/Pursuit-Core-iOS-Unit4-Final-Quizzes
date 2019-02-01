//
//  QuizModel.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct QuizCollection: Codable {
    let quiz: [Quizzes]
}
struct Quizzes: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}
