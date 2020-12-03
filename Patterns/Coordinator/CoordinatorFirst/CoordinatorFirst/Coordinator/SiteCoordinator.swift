//
//  SiteCoordinator.swift
//  CoordinatorFirst
//
//  Created by Aiur on 03.12.2020.
//

import UIKit

class SiteCoordinator: Coordinator {
    weak var parentCoordinator: InfoCoordinator?
    var childs: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var delegate: SiteDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SiteViewController()
        vc.coordinator = self
        vc.delegate = delegate
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didEndEditing() {
        parentCoordinator?.childDidFinish(self)
    }
}
