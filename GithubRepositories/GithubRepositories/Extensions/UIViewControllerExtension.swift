//
//  UIViewControllerExtension.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/25/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChild(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        willMove(toParentViewController: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
}
