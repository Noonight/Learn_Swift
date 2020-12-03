//
//  File.swift
//  CoordinatorFirst
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
}
