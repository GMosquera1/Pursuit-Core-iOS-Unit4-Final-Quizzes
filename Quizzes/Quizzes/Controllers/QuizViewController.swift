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
    
    var quizInfo = [QuizCollection](){
        didSet {
            DispatchQueue.main.async {
//self.quizView.quizCollectionView.reloadData()
            }
        }
    }

    @IBOutlet weak var quizCV: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
print(DataPersistenceManager.documentsDirectory())
    }
}

//extension QuizViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 7
//    }
//    
//}
