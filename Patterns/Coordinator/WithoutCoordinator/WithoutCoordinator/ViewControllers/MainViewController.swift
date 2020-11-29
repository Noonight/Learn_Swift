//
//  ViewController.swift
//  Coordinator1
//
//  Created by Aiur on 29.11.2020.
//

import UIKit

class MainViewController: UIViewController {

    private let containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    private let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Main View Controller"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let navigationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Navigation View", for: .normal)
        return button
    }()
    private let withoutNavigationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Without Navigation View", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupActions()
        view.backgroundColor = .lightGray
    }
}

// MARK: - Setup View
private extension MainViewController {
    func setupView() {
        view.addSubview(containerView)
        NSLayoutConstraint.activate(
            [view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: containerView.topAnchor),
             view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)]
        )
        
        containerView.addSubview(labelView)
        containerView.addSubview(navigationButton)
        containerView.addSubview(withoutNavigationButton)
        
        NSLayoutConstraint.activate(
            [containerView.topAnchor.constraint(equalTo: labelView.topAnchor),
             containerView.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),

             labelView.bottomAnchor.constraint(equalTo: navigationButton.topAnchor),

             containerView.leadingAnchor.constraint(equalTo: navigationButton.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: navigationButton.trailingAnchor),

             navigationButton.bottomAnchor.constraint(equalTo: withoutNavigationButton.topAnchor),

             containerView.leadingAnchor.constraint(equalTo: withoutNavigationButton.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: withoutNavigationButton.trailingAnchor),
             containerView.bottomAnchor.constraint(equalTo: withoutNavigationButton.bottomAnchor)
            ]
        )
        
        labelView.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .vertical)
        navigationButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        withoutNavigationButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
    }
    func setupActions() {
        navigationButton.addTarget(self, action: #selector(tapWithNavigationVCButton(_:)), for: .touchUpInside)
        withoutNavigationButton.addTarget(self, action: #selector(tapWithoutNavigationVCButton(_:)), for: .touchUpInside)
    }
}

// MARK: - Actions
private extension MainViewController {
    @objc func tapWithNavigationVCButton(_ sender: UIButton) {
        showWithNavigationVC()
    }
    @objc func tapWithoutNavigationVCButton(_ sender: UIButton) {
        showWithoutNavigationVC()
    }
}

// MARK: - Navigation
private extension MainViewController {
    func showWithNavigationVC() {
        let vc = self.createNavController(rootViewController: WithNavigationViewController())
        self.show(vc, sender: self)
    }
    func showWithoutNavigationVC() {
        let vc = WithoutNavigationViewController()
        self.present(vc, animated: true)
    }
}

// MARK: - Helpers
private extension MainViewController {
    /// use if parent vc is not wrapped in navigation controller and you want to wrap target view controller in navitation
    func createNavController(rootViewController: UIViewController) -> UINavigationController {
        let viewController = UINavigationController(rootViewController: rootViewController)
        viewController.navigationBar.prefersLargeTitles = true
        return viewController
    }
}
