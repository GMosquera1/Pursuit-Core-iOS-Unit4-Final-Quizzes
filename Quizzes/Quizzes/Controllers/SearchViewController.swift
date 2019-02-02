//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let searchView = SearchView()
    var quizInfo = [QuizCollection](){
        didSet {
            DispatchQueue.main.async {
                self.searchView.searchCollectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.view.addSubview(searchView)
        self.searchView.searchCollectionView.dataSource = self
        self.searchView.searchCollectionView.delegate = self
        allQuizzes()
        

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

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return quizInfo.count
            //quizInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchQuizViewCell", for: indexPath) as? SearchQuizViewCell else { return UICollectionViewCell() }
       let quiz = quizInfo[indexPath.row]
        cell.quizText.text = quiz.quizTitle
        return cell
    }
    
    
}
