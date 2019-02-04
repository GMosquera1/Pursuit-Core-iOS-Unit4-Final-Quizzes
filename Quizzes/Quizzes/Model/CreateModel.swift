//
//  NewFactModel.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/4/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


final class CreateModel {
    private static let fileName = "SearchList.plist"
    private static var newQuiz = [NewQuiz]()
    
    static func getQuiz() -> [NewQuiz] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    newQuiz = try PropertyListDecoder().decode([NewQuiz].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("Data is nil")
            }
        } else {
            print("\(fileName) doesn't exist")
        }
        newQuiz = newQuiz.sorted{$0.date > $1.date}
        return newQuiz
        
    }
    static func addItem(quiz: NewQuiz) {
        
        newQuiz.append(quiz)
        save()
    }
    
    static func delete(quiz: NewQuiz, atIndex index: Int) {
        newQuiz.remove(at: index)
        save()
    }
    static func save() {
        // path
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(newQuiz)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
    }
    
}
