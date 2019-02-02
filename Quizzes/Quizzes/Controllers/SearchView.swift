//
//  SearchView.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
    public lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 350)
        layout.sectionInset = UIEdgeInsets.init(top: 22, left: 11, bottom: 22, right: 22)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        cv.backgroundColor = .red
        cv.register(SearchQuizViewCell.self, forCellWithReuseIdentifier: "SearchQuizViewCell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .yellow
        setconstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setconstrains() {
        addSubview(searchCollectionView)
        
searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor), searchCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor)
            
            ])
    }
}
