//
//  InfoViewController.swift
//  Navigation
//
//  Created by Irina Bashkova on 06.07.2023.
//

import UIKit


class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alert", for: .normal)
     
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(tapBarButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
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
            button.heightAnchor.constraint(equalToConstant: 50),    //UIScreen.main.bounds.height / 8
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)
        ])
        
    }
}
