//
//  NewQuizModel.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct NewQuiz: Codable {
    let user: String
    let quizTitle: String
    let favoritedAt: String
    
    public var date: Date {
        let date = favoritedAt.date()
        return date 
    }
}
