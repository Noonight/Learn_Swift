//
//  PaymentViewController.swift
//  Coordinator1
//
//  Created by Aiur on 29.11.2020.
//

import UIKit

class WithNavigationViewController: UIViewController {
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Navigation View Controller"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go next", for: .normal)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupActions()
        navigationItem.title = "Navigation View"
        view.backgroundColor = .lightGray
    }
}

// MARK: - Setup View
private extension WithNavigationViewController {
    func setupView() {
        view.addSubview(labelView)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate(
            [view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
             view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: labelView.topAnchor),
             view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
             
             labelView.bottomAnchor.constraint(equalTo: nextButton.topAnchor),
             
             view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor),
             view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor),
             view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor)
            ]
        )
    }
    func setupActions() {
        nextButton.addTarget(self, action: #selector(tapGoNext(_:)), for: .touchUpInside)
    }
}

// MARK: - Action
private extension WithNavigationViewController {
    @objc func tapGoNext(_ sender: UIButton) {
        showNext()
    }
}

// MARK: - Navigation
private extension WithNavigationViewController {
    func showNext() {
        if let navigationController = self.navigationController {
            let vc = GoNextNavigationViewController()
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
