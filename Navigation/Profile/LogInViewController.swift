//
//  Irina Bashkova.swift
//  Navigation
//
//  Created by Irina Bashkova on 30.09.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        print("сработало 1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
   
       print("сработало 2")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("сработало 3")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
             super.viewWillDisappear(animated)

        print("сработало 4")
         }
    
}
