//
//  FeedViewController.swift
//  Navigation
//
//  Created by Irina Bashkova on 05.07.2023.
//


import UIKit

class FeedViewController: UIViewController {
    
    
    var post = Post(titel: "мой первый пост")
    
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Лента"
        view.backgroundColor = .systemGray
        
        view.addSubview(actionButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            actionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
        let postViewController = PostViewController()
        postViewController.post = self.post
        
        navigationController?.pushViewController(postViewController, animated: true)
        
//        postViewController.modalTransitionStyle = .coverVertical
//        postViewController.modalPresentationStyle = .pageSheet
//        present(postViewController, animated: true)
        
    }
}


