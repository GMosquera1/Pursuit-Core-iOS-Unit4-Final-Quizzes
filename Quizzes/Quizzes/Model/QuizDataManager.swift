//
//  QuizDataManager.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizDataManager {
    private init() {}
    
    private static let filename = "NewQuiz.plist"
    
    static public func fetchNewQuizFromDocumentsDirectory() -> [QuizCollection] {
        var quiz = [QuizCollection]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quiz = try PropertyListDecoder().decode([QuizCollection].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return quiz
    }
    
    static public func saveToDocumentDirectory(savedQuiz: QuizCollection) -> (success: Bool, error: Error?) {
        var newQuiz = fetchNewQuizFromDocumentsDirectory()
        newQuiz.append(savedQuiz)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(newQuiz)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
            return (false, error)
        }
        return (true, nil)
    }
    
    static func delete(newQuiz: NewQuiz, atIndex index: Int) {

        var newQuiz = fetchNewQuizFromDocumentsDirectory()
        newQuiz.remove(at: index)
    
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(newQuiz)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static public func isFavorite(id: String) -> Bool {
        let index = fetchNewQuizFromDocumentsDirectory().index { $0.id == id }
        var found = false
        if let _ = index {
            found = true
        }
        return found
    }
    
    
}
