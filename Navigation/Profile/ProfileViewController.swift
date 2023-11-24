//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina Bashkova
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonSetTitle: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change title", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .blue
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        layout()
    }
    
    @objc private func changeTitle() {
        title = "New Title"
    }
    
    private func layout() {
        view.addSubview(profileHeaderView)
        view.addSubview(buttonSetTitle)
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            buttonSetTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonSetTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonSetTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
}

