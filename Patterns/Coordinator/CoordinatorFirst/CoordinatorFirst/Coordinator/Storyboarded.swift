//
//  Storyboarded.swift
//  CoordinatorFirst
//
//  Created by Aiur on 30.11.2020.
//

import UIKit

/// Helper to work with controllers created from storyboard
protocol Storyboarded {
    /// You have to use same id of controller as controller class name on storyboard
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
