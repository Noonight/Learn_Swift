//
//  CreateAccountViewController.swift
//  CoordinatorFirst
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create Account View Controller"
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        navigationItem.title = "Create Account View Controller"
        view.backgroundColor = UIColor(named: "customBackgroundColor")
    }
}

// MARK: - Setup View
private extension CreateAccountViewController {
    func setupView() {
        self.view.addSubview(labelView)
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
