//
//  Coordinator.swift
//  CoordinatorFirst
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

protocol Coordinator: AnyObject {
    var childs: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    /// present new controller
    func start()
}
