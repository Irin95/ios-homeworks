//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Irina Bashkova
//

import UIKit

class ProfileViewController: UIViewController {
    
    fileprivate let data = feedPost
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileTableView)
        
        setupConstraints()
        tuneTableView()
        
    }
    
    private func setupConstraints() {
        let safeAreaGeide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: safeAreaGeide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: safeAreaGeide.bottomAnchor),
            profileTableView.leftAnchor.constraint(equalTo: safeAreaGeide.leftAnchor),
            profileTableView.rightAnchor.constraint(equalTo: safeAreaGeide.rightAnchor),
            
        ])
    }
    
    private func tuneTableView() {
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 44.0
        let headerView = ProfileHeaderView()
        
        profileTableView.setAndLayout(headerView: headerView)
        
        profileTableView.tableHeaderView?.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.tableHeaderView?.autoresizesSubviews = true
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "post")
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "post",
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        
        cell.update(data[indexPath.row])
        
        return cell
    }
    
}

extension UITableView {
    
    func setAndLayout(headerView: UIView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
