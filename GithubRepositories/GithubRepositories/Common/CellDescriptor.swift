//
//  CellDescriptor.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/24/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import UIKit

class CellDescriptor {
    let nibName: String
    let identifier: String
    
    init(nibName: String, identifier: String? = nil) {
        self.nibName = nibName
        self.identifier = identifier == nil ? nibName : identifier!
    }
    
    func register(in tableView: UITableView) {
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func register(in collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}

