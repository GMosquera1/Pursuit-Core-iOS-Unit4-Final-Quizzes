//
//  QuizCollectionViewCell.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setUpView()
    }
    
    
    public lazy var quizText: UITextView = {
       let textView = UITextView()
        textView.text = "Hola"
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        return textView
    }()
    
    public lazy var optionsButton: UIButton = {
        let button = UIButton()
      //  button.setTitle(". . .", for: .normal)
        button.setImage(UIImage.init(named: "plus-icon"), for: .normal)
        button.addTarget(self, action: #selector(addToDatabase), for: .touchUpInside)
        return button
    }()
    
    @objc func addToDatabase(sender: UIButton) {
        print("pressed")
//        let alertController = UIAlertController(title: "Default Search", message: "Please enter a default zip code e.g 10023 or city name e.g Miami", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        let submitAction = UIAlertAction(title: "Submit", style: .default)
//        alertController.addAction(cancelAction)
//        alertController.addAction(submitAction)
       // present(alertController, animated: true)
    
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
//            print("User defaults was added to your Quiz Collection")
//        }))
//        alert.addAction(UIAlertAction(title: "Okay", style: .default , handler: { (_) in
//            print("User clicked 'Cancel' button")
//        }))
            }
    
    
    func setUpView() {
    addSubview(quizText)
    addSubview(optionsButton)
        quizText.translatesAutoresizingMaskIntoConstraints = false
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), quizText.leadingAnchor.constraint(equalTo: leadingAnchor), quizText.trailingAnchor.constraint(equalTo: trailingAnchor), quizText.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50),
            optionsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)      , optionsButton.rightAnchor.constraint(equalTo: rightAnchor)
            ])  
    }
    
}
