//
//  LoadingVC.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/25/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {
 
    // Activity Indicator
    private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor), activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [weak self] in
            self?.activityIndicator.startAnimating()
        }
    }
}
