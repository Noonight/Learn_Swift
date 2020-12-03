//
//  SiteViewController.swift
//  CoordinatorFirst
//
//  Created by Aiur on 03.12.2020.
//

import UIKit

class SiteViewController: UIViewController {

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
        label.text = "Site View Controller"
        return label
    }()
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        return textField
    }()
    
    weak var coordinator: SiteCoordinator?
    weak var delegate: SiteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationItem.title = "Site View Controller"
        view.backgroundColor = UIColor(named: "customBackgroundColor")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.didDisappear(name: nameTextField.text ?? "Empty Text field")
        coordinator?.didEndEditing()
    }
    
    
}

// MARK: - Setup View
private extension SiteViewController {
    func setupView() {
        stackView.addArrangedSubview(labelView)
        stackView.addArrangedSubview(nameTextField)
        view.addSubview(stackView)
        NSLayoutConstraint.activate(
            [stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        )
    }
}
