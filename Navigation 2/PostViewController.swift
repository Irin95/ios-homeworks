//
//  PostViewController.swift
//  Navigation
//
//  Created by Irina Bashkova on 06.07.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post? {
        didSet {
            self.navigationItem.title = post?.titel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray3
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapBarButton))
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tapBarButton() {
        let infoVC = InfoViewController()
        infoVC.modalTransitionStyle = .flipHorizontal
        infoVC.modalPresentationStyle = .pageSheet
        present(infoVC, animated: true)
    }
    
}





