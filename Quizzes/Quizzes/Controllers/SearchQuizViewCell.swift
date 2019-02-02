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
        button.setTitle(". . .", for: .normal)
        return button
        
    }()
    
    
    func setUpView() {
    addSubview(quizText)
    addSubview(optionsButton)
        quizText.translatesAutoresizingMaskIntoConstraints = false
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), quizText.leadingAnchor.constraint(equalTo: leadingAnchor), quizText.trailingAnchor.constraint(equalTo: trailingAnchor), quizText.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)
            ])  
    }
    
}
