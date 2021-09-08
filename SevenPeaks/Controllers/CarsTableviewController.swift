//
//  CarsTVC.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 24/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class CarsTableviewController: UITableViewController {
    
    //MARK: - Properties
    let dispose = DisposeBag()
    private var viewModel: CarListViewModel!
    
    static func instantiate(viewModel: CarListViewModel) -> CarsTableviewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! CarsTableviewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        tableView.tableFooterView = UIView()
        viewModel?.fetchCarViewModel().bind(to: tableView.rx.items(cellIdentifier: "CarCell") ) { index, viewModel, cell in
            guard let cell = cell as? CarCell else { return }
            cell.loadCarDataIntoCell(carViewModel: viewModel)
        }.disposed(by: dispose)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 407
    }
}
