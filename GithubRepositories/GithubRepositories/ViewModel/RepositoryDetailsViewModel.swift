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
        }
    }
    private let disposeBag = DisposeBag()
    
    
    // Outputs
    public var repositoryObservable: Observable<Repository>!
    
}
