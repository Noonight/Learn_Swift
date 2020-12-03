//
//  InfoCoordinator.swift
//  CoordinatorFirst
//
//  Created by Aiur on 03.12.2020.
//

import UIKit

class InfoCoordinator: Coordinator, Site {
    weak var parentCoordinator: MainCoordinator? = nil
    var childs: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var delegate: SiteDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = InfoViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentSite() {
        let child = SiteCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        
        child.delegate = self.delegate
        
        childs.append(child)
        child.start()
    }
    
    func didFinishLookingInfo() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childs.enumerated() {
            if coordinator === child {
                childs.remove(at: index)
                break
            }
        }
    }
}
