//
//  BuyCoordinator.swift
//  CoordinatorFirst
//
//  Created by Aiur on 01.12.2020.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator? = nil
    var childs: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
