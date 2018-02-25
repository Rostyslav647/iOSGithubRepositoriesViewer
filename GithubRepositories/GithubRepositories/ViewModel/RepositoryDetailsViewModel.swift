//
//  RepositoryDtailsViewModel.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/25/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import RxSwift

class RepositoryDetailsViewModel {
    // Variables
    var repository: Variable<Repository>! {
        willSet{
            repositoryObservable = newValue.asObservable()
            getTags(for: newValue.value)
        }
    }
    
    var tags: Variable<Tags> = Variable([])
    
    // Outputs
    var repositoryObservable: Observable<Repository>!
    var tagsObservable: Observable<Tags>!
    
    init() {
        self.tagsObservable = tags.asObservable()
    }
    
    func getTags(for repository: Repository) {
        
        guard let urlString = repository.tagsURL,
            let url = URL(string: urlString) else {
                return
        }
        
        GithubAPIService.shared.getTags(url: url) { [weak self] tags in
            DispatchQueue.main.async {
                guard let tags = tags else { return }
                self?.tags.value = tags
            }
        }
    }
}
