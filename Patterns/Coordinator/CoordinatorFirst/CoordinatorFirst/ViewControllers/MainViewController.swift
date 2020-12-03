//
//  ViewController.swift
//  CoordinatorFirst
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: (Buying & CreateAccount & Info)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapBuy(_ sender: UIButton) {
        coordinator?.presentBuy()
    }
    @IBAction func tapCreateAcc(_ sender: UIButton) {
        coordinator?.presentCreateAccount()
    }
    @IBAction func tapInfo(_ sender: UIButton) {
        coordinator?.presentInfo()
    }
}

