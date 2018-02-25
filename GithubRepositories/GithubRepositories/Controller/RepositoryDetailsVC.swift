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

protocol RepositoryDetailsVCInput {
    func configure(with model: Repository)
}

class RepositoryDetailsVC: UIViewController, RepositoryDetailsVCInput {
    
    // Outlets
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var forksView: ItemPropertyView!
    @IBOutlet weak var starsView: ItemPropertyView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    // Variable
    let viewModel = RepositoryDetailsViewModel()
    let disposeBag = DisposeBag()
    let loadingVC = LoadingVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(viewModel.repository.value)
        setupBindings()
        self.addChild(loadingVC)
    }
    
    func setupBindings(){
        viewModel.tagsObservable
            .do(onNext:{ [weak self] tags in
                self?.loadingVC.remove()
            })
            .map{ tags -> String in
                let tagsString = tags.reduce("", { result, tag -> String in
                    return result + (tag.name ?? "") + "\n"
                })
                return tagsString.isEmpty ? "No tags" : tagsString
            }
            .bind(to: tagsLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.repositoryObservable
            .map { repository -> String in
                return repository.owner?.login ?? "No authors name"
            }
            .bind(to: authorLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.repositoryObservable
            .map { repository -> String in
                return repository.description ?? "No description"
            }
            .bind(to: descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.repositoryObservable
            .map { repository -> String in
                return repository.htmlURL ?? "No URL"
            }
            .bind(to: urlButton.rx.title(for: .normal))
            .disposed(by: disposeBag)
        
        viewModel.repositoryObservable
            .map { repository -> String in
                return repository.name ?? "No name"
            }
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
    }
    
    func configure(with model: Repository){
        viewModel.repository = Variable(model)
    }
    
    func updateView(_ model: Repository) {
        forksView.configure(Asset.fork.image, String(model.forks ?? 0))
        starsView.configure(Asset.star.image, String(model.stargazersCount ?? 0))
    }
    
    // Handlers
    @IBAction func urlButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: sender.currentTitle ?? "") else { return }
        let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: true)
        present(safariVC, animated: true)
    }
}
