//
//  AppDelegate.swift
//  Coordinator1
//
//  Created by Aiur on 29.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        let viewController = MainViewController()
        
        self.window?.rootViewController = viewController
        
        return true
    }
}

