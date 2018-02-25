//
//  RepositoryDetailsVC.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/25/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import RxCocoa
import RxSwift
import SafariServices

class RepositoryDetailsVC: UIViewController {

    // Outlets
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var forksView: ItemPropertyView!
    @IBOutlet weak var starsView: ItemPropertyView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    // Variable
    let viewModel = RepositoryDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(viewModel.repository.value)
    }
    
    func configure(with model: Repository){
        viewModel.repository = Variable(model)
    }
    
    func updateView(_ model: Repository) {
        title = model.name
        urlButton.setTitle(model.htmlURL, for: .normal)
        authorLabel.text = model.owner?.login
        forksView.configure(Asset.fork.image, String(model.forks ?? 0))
        starsView.configure(Asset.star.image, String(model.stargazersCount ?? 0))
        descriptionLabel.text = model.description ?? "No description"
        tagsLabel.text = model.tagsURL ?? "No tags"
    }
    
    @IBAction func urlButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: sender.currentTitle ?? "") else { return }
        let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: true)
        present(safariVC, animated: true)
    }
}
