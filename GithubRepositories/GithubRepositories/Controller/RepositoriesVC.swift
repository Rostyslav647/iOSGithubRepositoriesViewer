//
//  RepositoriesVC.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/23/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import RxCocoa
import RxSwift

class RepositoriesVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    // Variables
    var cellDescriptor = CellDescriptor(nibName: "RepositoryCell")
    let repositoryViewModel = RepositoryViewModel()
    let disposeBag = DisposeBag()
    let loadingVC = LoadingVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github Repositories"
        cellDescriptor.register(in: repositoriesTableView)
        addDelegate()
        setupTableViewBinding()
        self.addChild(loadingVC)
    }
    
    func addDelegate(){
        repositoriesTableView.delegate = nil
        repositoriesTableView.dataSource = nil
    }
    
    func setupTableViewBinding() {
        
        repositoryViewModel.dataSourceObservable
            .do(onNext:  { [unowned self] repositories in
                    self.loadingVC.remove()
            })
            .bind(to: self.repositoriesTableView.rx.items(cellIdentifier: cellDescriptor.identifier, cellType: RepositoryCell.self)) {  row, element, cell in
                
                cell.configure(element)
            }
            .disposed(by: self.disposeBag)
        
        repositoriesTableView.rx.itemSelected
            .map {
                $0.item
            }.subscribe(onNext: { [weak self] (index) in
                let model = self?.repositoryViewModel.dataSource.value[index]
                self?.repositoriesTableView.deselectRow(at: IndexPath.init(row: index, section: 0), animated: true)
                self?.navigateToDetailedPage(model!)
            })
            .disposed(by:disposeBag)
    }
    
    func navigateToDetailedPage(_ model: Repository){
        let repositoryDetailsVC = storyboard?.instantiateViewController(withIdentifier: "RepositoryDetailsVC") as! RepositoryDetailsVC
        repositoryDetailsVC.configure(with: model)
        self.navigationController?.pushViewController(repositoryDetailsVC, animated: true)
    }
}

extension RepositoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
