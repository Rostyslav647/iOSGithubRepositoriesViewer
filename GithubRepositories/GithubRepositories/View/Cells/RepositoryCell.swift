//
//  RepositoryCell.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/24/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var forkView: ItemPropertyView!
    @IBOutlet weak var starsView: ItemPropertyView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ repository: Repository){
        repositoryNameLabel.text = repository.name
        descriptionLabel.text = repository.description ?? "No description"
        forkView.configure(Asset.fork.image, String(repository.forksCount ?? 0))
        starsView.configure(Asset.star.image, String(repository.stargazersCount ?? 0))
    }
}
