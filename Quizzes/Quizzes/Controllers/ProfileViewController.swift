//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Genesis Mosquera on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    public var userImage: UserModel!

    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var addNameButton: UIButton!
    
    @IBOutlet weak var profileButton: UITabBarItem!
    
    private var defaultLogin = "" {
        didSet {
            
        }
    }
    
    private var imagePickerViewController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        addImageButton.layer.cornerRadius  = addImageButton.frame.width / 2
        addImageButton.clipsToBounds = true
        setupImagePickerViewController()
        //showImagePickerController()
       // imagePickerViewController.delegate =
      // tabBarController.delegate = self
        
    }
//    private func showImagePickerController() {
//        present(imagePickerViewController, animated: true, completion: nil)
//    }
    
    private func nameAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupImagePickerViewController() {
        imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            profileButton.isEnabled = false
        }
        
    }

 
    private func updateUserInfo() {
        let alertController = UIAlertController(title: "Please Enter Your Username", message: "No spaces allowed or special characters", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "Submit", style: .default)

            return
        }
    
    
    
//    private func viewDidAppear(_ animated: Bool) {
//        UITabBarItem*helpButton = [[UIBarBarButtonItem alloc] initWithTitle:@"Help" style:UIBarButtonItemStylePlain target:self action:@selector(helpButtonPressed))];
//        self.tabBarController.navigationItem.rightBarButtonItem=helpButton;
//    }
    private func updateUI() {
        if let user = userImage {
            self.addImageButton.imageView?.image = UIImage.init(data: user.imageData)
            
        }
    }

    
    
    @IBAction func imageButtonPressed(_ sender: UIButton) {
         let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
            self.imagePickerViewController.sourceType = .photoLibrary
            self.setupImagePickerViewController()
            //showImagePickerController()
            self.present(self.imagePickerViewController, animated: true, completion: nil)
            print("User clicked 'PhotoLibrary' button")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User clicked 'Cancel' button")
        }))

        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        
        if tabBarController.selectedIndex == 0  {
            viewController.viewDidLoad()
        }
    }

}
//extension ProfileViewController: UITabBarController, UITabBarDelegate {
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("test")
//    }
//}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //self.addImageButton.imageView?.image = image
            addImageButton.setImage(image, for: .normal)
            
            
        }
        dismiss(animated: true, completion: nil)
    }
}
