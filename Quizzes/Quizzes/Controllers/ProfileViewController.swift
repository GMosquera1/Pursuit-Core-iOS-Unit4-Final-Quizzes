//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var addNameButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func imageButtonPressed(_ sender: UIButton) {
         let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
            print("User clicked 'Share' button")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User clicked 'Cancel' button")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

}
