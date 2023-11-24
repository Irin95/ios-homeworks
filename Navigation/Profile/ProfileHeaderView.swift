//
//  ProfileHeaderView.swift
//  Navigation
//
//Created by Irina Bashkova

import UIKit

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 10,
        bottom: 10,
        right: 10
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}









class ProfileHeaderView: UIView {

    private var statusText: String = ""
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cat")
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .gray
        text.text = "Waiting for something..."
        text.textAlignment = .center
        text.layer.borderWidth = 1
        text.layer.backgroundColor = UIColor.white.cgColor
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 12
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return text
    }()
    
    private lazy var statusLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .systemGray
        text.text = "Status"
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return text
    }()
    
    private lazy var buttonStatus: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(tapButtonStatus), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapButtonStatus() {
        statusLabel.text = statusText
        print(textField.text ?? "")
    }
    
    @objc private func statusTextChanged() {
        statusText = textField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        let constant: CGFloat = 16
        let imageWidth = UIScreen.main.bounds.width / 3.5
        
        [buttonStatus, avatarImage, nameLabel, statusLabel, textField].forEach {addSubview($0)}
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: constant),
            avatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: constant),
            avatarImage.widthAnchor.constraint(equalToConstant: imageWidth),
            avatarImage.heightAnchor.constraint(equalToConstant: imageWidth),
            
            buttonStatus.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: constant),
            buttonStatus.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: constant),
            buttonStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -constant),
            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),
            
            textField.bottomAnchor.constraint(equalTo: buttonStatus.topAnchor, constant: -14),
            textField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 5),
            textField.trailingAnchor.constraint(equalTo: buttonStatus.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    
}
