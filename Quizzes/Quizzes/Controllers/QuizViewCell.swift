//
//  QuizViewCellCollectionViewCell.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/4/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewCell: UICollectionViewCell {
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow //override init(frame: CGRect) {
            //super.init(frame: frame)
         //   backgroundColor = .red
            commonInit()
       // }
    }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            setUpView()
        }
        
        
        public lazy var quizText: UILabel = {
            let label = UILabel()
            label.text = "Hola"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
            return label
        }()
    
    
        
        public lazy var flipButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage.init(named: "more-filled"), for: .normal)
            
            return button
        }()

    
    

    
        func setUpView() {
            addSubview(quizText)
            addSubview(flipButton)
            quizText.translatesAutoresizingMaskIntoConstraints = false
            flipButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
//                quizText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                
                quizText.leadingAnchor.constraint(equalTo: leadingAnchor), quizText.trailingAnchor.constraint(equalTo: trailingAnchor),
                flipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), flipButton.rightAnchor.constraint(equalTo: rightAnchor)
                ])
        }
}


