//
//  FeedViewController.swift
//  Navigation
//
//  Created by Irina Bashkova on 05.07.2023.
//


import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(titel: "мой первый пост")
    let postTwo = Post(titel: "мой второй пост")
    
    private lazy var actionFirstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var actionSecondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle("Перейти 2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonPressedTwo(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.backgroundColor = .brown
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        title = "Лента"
        view.backgroundColor = .systemGray
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
        let postViewController = PostViewController()
        postViewController.post = self.post
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    @objc func buttonPressedTwo(_ sender: UIButton) {
        dismiss(animated: true)
        let postViewController = PostViewController()
        postViewController.post = self.postTwo
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func layout() {
        view.addSubview(stackView)
        [actionFirstButton, actionSecondButton].forEach{stackView.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 * 2)
        ])
    }
}


