//
//  AppCoordinator.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 25/07/21.
//

import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = CarsTableviewController.instantiate(viewModel: CarListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = UIColor.gray
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
