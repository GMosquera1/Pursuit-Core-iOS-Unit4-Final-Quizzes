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
    @objc func deleteQuiz(sender: UIButton) {
        deleteButton()
        
        
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
    
    private func deleteButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            //showImagePickerController()
            print("User clicked 'PhotoLibrary' button")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User clicked 'Cancel' button")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
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
        cell.flipButton.addTarget(self, action: #selector(deleteQuiz), for: .touchUpInside)
        cell.flipButton.tag = indexPath.row
        return cell
    }
    
    
}

