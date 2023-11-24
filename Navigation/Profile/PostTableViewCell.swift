//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Irina Bashkova on 24.11.2023.
//

import Foundation
import UIKit


 class PostTableViewCell: UITableViewCell {

     private lazy var postAuthorLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         label.textColor = .black
         label.numberOfLines = 2
         label.backgroundColor = .white
         return label
     }()

     private lazy var postDescriptionLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .systemGray
         label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         label.numberOfLines = 0
         return label
     }()

     private lazy var postImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.backgroundColor = .white
         imageView.contentMode = .scaleAspectFit
         return imageView
     }()

     private lazy var postLikesLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .black
         label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
         return label
     }()

     private lazy var postViewsLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .black
         label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
         return label
     }()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: .default, reuseIdentifier: reuseIdentifier)
         tuneView()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

 //    override func awakeFromNib() {
 //        super.awakeFromNib()
 //        // Initialization code
 //    }
     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }

     private func tuneView() {
         addSubview(postAuthorLabel)
         addSubview(postDescriptionLabel)
         addSubview(postImageView)
         addSubview(postLikesLabel)
         addSubview(postViewsLabel)

         setupConstraints()
     }

     private func setupConstraints() {
         NSLayoutConstraint.activate([
             postAuthorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
             postAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             postAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

             postImageView.topAnchor.constraint(equalTo: postAuthorLabel.bottomAnchor, constant: 16),
             postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
             postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1),
             postImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

             postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
             postDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             postDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             //postDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
             
             postLikesLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
             postLikesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             postLikesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

             postViewsLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
             postViewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
             postViewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

         ])
     }

     func update(_ post: Post) {
         postAuthorLabel.text = post.author
         postImageView.image = UIImage(named: post.image)
         postDescriptionLabel.text = post.description
         postLikesLabel.text = "Likes: \(post.likes)"
         postViewsLabel.text = "Views: \(post.views)"
     }

 }
