//
//  RepositoryViewModel.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/23/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import RxSwift

class RepositoryViewModel {
    
    // Variables
    var dataSource: Variable<Repositories> = Variable([])
    private let disposeBag = DisposeBag()
   
    // Outputs
    public var dataSourceObservable: Observable<[Repository]>
    
    init() {
        // Make the output dataSource an Observable of the privateDataSource
            self.dataSourceObservable = dataSource.asObservable()
            getRepositories()
    }
    
    func getRepositories() {
        GithubAPIService.shared.getRepositories { repositories in
            if let repositories = repositories {
                print("\(repositories.count)")
                DispatchQueue.main.async {
                    self.dataSource.value = repositories.sorted{ $0.name!.caseInsensitiveCompare($1.name!) == ComparisonResult.orderedAscending }
                }
            } else {
                print("No data available!!!")
            }
        }
    }
}
