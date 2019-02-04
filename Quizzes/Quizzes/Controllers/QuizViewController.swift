//
//  QuizViewController.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    let quizView = QuizVIew()
    
    var createModel = [CreateModel]()
    
    var quizInfo = [QuizCollection](){
        didSet {
            DispatchQueue.main.async {
                //self.quizView.quizCollectionView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        quizView.quizCollectionView.reloadData()
    }
    
    @IBOutlet weak var quizCV: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(quizView)
        self.quizView.quizCollectionView.dataSource = self
        self.quizView.quizCollectionView.delegate = self
        allQuizzes()
        print(DataPersistenceManager.documentsDirectory())
    }
    func allQuizzes() {
        
        QuizAPIClient.getQuiz { (appError, quiz) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let quiz = quiz {
                self.quizInfo = quiz
                dump(self.quizInfo)
            }
            
        }
    }
}


extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CreateModel.getQuiz().count
        //quizInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizViewCell", for: indexPath) as? QuizViewCell else { return UICollectionViewCell() }
        let quiz = CreateModel.getQuiz()[indexPath.row]
        cell.quizText.text = quiz.quizTitle
        return cell
    }
    
    
}

