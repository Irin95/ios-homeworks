//
//  Irina Bashkova.swift
//  Navigation
//
//  Created by Irina Bashkova on 30.09.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    
    
    
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        return view
    }()
    
    
    private lazy var emailTextField: TextFieldWithPadding = { [unowned self] in
        let textField = TextFieldWithPadding()
        textField.placeholder = "Email or phone"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.delegate = self
        return textField
    }()
    private lazy var passwordTextField: TextFieldWithPadding = { [unowned self] in
        let textField = TextFieldWithPadding()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.delegate = self
        return textField
    }()
    
    
    
    private lazy var logInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.backgroundColor = .systemGray6
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(blankView)
        stackView.addArrangedSubview(passwordTextField)
        return stackView
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
      button.addTarget(self, action: #selector(logInButtonPrassed), for: .touchUpInside)
        return button
    }()
    
    private lazy var blankView: UIView = {
             let view = UIView()
             view.backgroundColor = .lightGray
             return view
         }()
    
    
    
    override func loadView() {
        super.loadView()
        print("сработало 1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubview()
        setConstraints()
        
        
        print("сработало 2")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("сработало 3")
        
        setupKeyboardObservers()
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("сработало 4")
    }
    
    private func setupView(){
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    
    
    private func setupSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(logInStackView)
        contentView.addSubview(logInButton)
        
    }
    
    
    
    
    
    
  
  
    
    
    
    private func setConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            logInStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            logInStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInStackView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            blankView.heightAnchor.constraint(equalToConstant: 0.5),
            blankView.centerYAnchor.constraint(equalTo: logInStackView.centerYAnchor)
            
            
            
            
        ])
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
             let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
             scrollView.contentInset.bottom = keyboardHeight ?? 0.0
         }

         @objc func willHideKeyboard(_ notification: NSNotification) {
             scrollView.contentInset.bottom = 0.0
         }

         @objc func logInButtonPrassed() {
             let ProfileViewController = ProfileViewController()
             if emailTextField.text != "" && passwordTextField.text != "" {
                 navigationController?.pushViewController(ProfileViewController, animated: true)
             }
         }
    
    private func setupKeyboardObservers() {
             let notificationCenter = NotificationCenter.default

             notificationCenter.addObserver(
                 self,
                 selector: #selector(self.willShowKeyboard(_:)),
                 name: UIResponder.keyboardWillShowNotification,
                 object: nil
             )

             notificationCenter.addObserver(
                 self,
                 selector: #selector(self.willHideKeyboard(_:)),
                 name: UIResponder.keyboardWillHideNotification,
                 object: nil
             )
         }
    
  
    
    
    
    
    
    
    
    
    private func removeKeyboardObservers() {
             let notificationCenter = NotificationCenter.default
             notificationCenter.removeObserver(self)
         }

     }
    
    
    
    

