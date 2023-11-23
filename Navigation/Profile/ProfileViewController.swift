//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina Bashkova
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }
    
    
    private func layout() {
        view.addSubview(profileHeaderView)
        
    }
    
}

