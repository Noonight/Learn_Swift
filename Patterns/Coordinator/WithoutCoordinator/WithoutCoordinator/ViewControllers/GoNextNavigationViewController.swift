//
//  GoNextViewController.swift
//  Coordinator1
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

class GoNextNavigationViewController: UIViewController {

    private let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "It's next from With Navigation View Controller"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        navigationItem.title = "Next of navigation"
        view.backgroundColor = .purple
    }

}

// MARK: - Setup View
private extension GoNextNavigationViewController {
    func setupView() {
        view.addSubview(labelView)
        NSLayoutConstraint.activate(
            [view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
             view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: labelView.topAnchor),
             view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
             view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: labelView.bottomAnchor)]
        )
    }
}
