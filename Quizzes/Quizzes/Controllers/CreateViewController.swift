//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    private var quizFact1Text = "Enter first quiz fact"
    private var quizFact2Text = "Enter second quiz fact"
    
    
    @IBOutlet weak var quizTitle: UITextField!
    
    @IBOutlet weak var quizFact1: UITextView!
    
    @IBOutlet weak var quizFact2: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        factsSetUp()
//print(DataPersistenceManager.documentsDirectory())
    }
    
    
    func factsSetUp(){
        quizTitle.delegate = self
        quizFact1.delegate = self
        quizFact1.textColor = .black
        quizFact1.text = quizFact1Text
        quizFact2.delegate = self
        quizFact2.textColor = .black
        quizFact2.text = quizFact2Text
    }
    
    func firstAlert (title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func secondAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        //navigationController?.pushViewController(QuizzesViewController(), animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createdPressed(_ sender: UIBarButtonItem) {
        guard let quizzesTitle = quizTitle.text,
            let firstFact = quizFact1.text,
            let secondFact  = quizFact2.text else {
                fatalError("The title description: nil")
        }

        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        
        if quizTitle?.text == "" || quizFact1?.text == "" || quizFact2?.text == "" || quizFact1.text == quizFact1Text || quizFact2.text == quizFact2Text {
            firstAlert(title: "Flash Card Notification", message: "Please fill out all required fields")
        } else {
            let quiz = NewQuiz.init(quizTitle: quizzesTitle, fact1: firstFact, fact2: secondFact, createdAt: timestamp)
        print("hi")
            CreateModel.addItem(quiz: quiz)
    navigationController?.pushViewController(QuizViewController(), animated: true)
            secondAlert(title: "Yay", message: "Your flash card has been succesfully added to your quizzes")
            
            dismiss(animated: true, completion: nil)
        }
    }
    }
    
extension CreateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if quizFact1.text == quizFact1Text {
            textView.text = ""
            textView.textColor = .black
        }
        if quizFact2.text == quizFact2Text {
            textView.text = ""
            textView.textColor = .black
        }
    }
}

extension CreateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        quizTitle.resignFirstResponder()
        return true
    }
}
