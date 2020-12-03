//
//  MainCoordinator.swift
//  CoordinatorFirst
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

class MainCoordinator: Coordinator, Buying, CreateAccount, Info {
    var childs: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// works only if view controller implements Storyboarded protocol
    func start() {
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childs.enumerated() {
            if coordinator === child {
                childs.remove(at: index)
                break
            }
        }
    }
    
    func presentBuy() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childs.append(child)
        child.start()
    }
    
    func presentCreateAccount() {
        let vc = CreateAccountViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentInfo() {
        let child = InfoCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childs.append(child)
        child.start()
    }
}
