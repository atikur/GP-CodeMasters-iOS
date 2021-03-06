//
//  AppDelegate.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = HomeController()
        let navController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

