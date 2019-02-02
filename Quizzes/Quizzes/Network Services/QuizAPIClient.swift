//
//  QuizAPIClient.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizAPIClient {
    
    static func getQuiz(completionHandler: @escaping (AppError?, [QuizCollection]?) -> Void)
    {
        NetworkHelper.shared.performDataTask(endpointURLString: "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                print(appError)
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let quizInfo = try JSONDecoder().decode([QuizCollection].self, from: data)
                    completionHandler(nil, quizInfo)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    
}
