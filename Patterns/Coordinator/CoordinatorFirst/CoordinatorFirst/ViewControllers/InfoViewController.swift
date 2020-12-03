//
//  InfoViewController.swift
//  CoordinatorFirst
//
//  Created by Aiur on 03.12.2020.
//

import UIKit

class InfoViewController: UIViewController {

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    private let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Info View Controller"
        return label
    }()
    private let btnView: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go Site View", for: .normal)
        return btn
    }()
    
    weak var coordinator: InfoCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupActions()
        setupInfoDelegate()
        navigationItem.title = "Info View Controller"
        view.backgroundColor = UIColor(named: "customBackgroundColor")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishLookingInfo()
    }
}

// MARK: - Setup View
private extension InfoViewController {
    func setupView() {
        stackView.addArrangedSubview(labelView)
        stackView.addArrangedSubview(btnView)
        view.addSubview(stackView)
        NSLayoutConstraint.activate(
            [stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        )
    }
    func setupActions() {
        btnView.addTarget(self, action: #selector(showSiteView(_:)), for: .touchUpInside)
    }
}

// MARK: - Setup Info Delegate
private extension InfoViewController {
    func setupInfoDelegate() {
        self.coordinator?.delegate = self
    }
}

// MARK: - Actions
private extension InfoViewController {
    @objc func showSiteView(_ sender: UIButton) {
        coordinator?.presentSite()
    }
}

// MARK: - SiteDelegate
extension InfoViewController: SiteDelegate {
    func didDisappear(name: String) {
        labelView.text = "New name = \(name)"
    }
}
