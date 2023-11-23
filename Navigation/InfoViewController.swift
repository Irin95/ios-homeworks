//
//  InfoViewController.swift
//  Navigation
//
//  Created by Павел Пушкин on 06.07.2023.
//

import UIKit


class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alert", for: .normal)
        button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(tapBarButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        layout()
    }
    
    @objc private func tapBarButton() {
        let alertVC = UIAlertController(title: "Title Alert", message: "Хотите закрыть данное модальное окно?", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Yes", style: .default) { _ in
            print("Close modal view controller")
            self.dismiss(animated: true)
            
            
            // navigationController?.popViewController(animated: true) - закрывает то, что push
            // dismiss(animated: true) - закрывает модальное окно
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Action Cancel")
        }
        alertVC.addAction(actionCancel)
        alertVC.addAction(actionOk)
        present(alertVC, animated: true)
    }
    
    private func layout() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)
        ])
        
    }
}
