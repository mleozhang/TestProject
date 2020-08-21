//
//  AppDelegate.swift
//  TestProject
//
//  Created by Leo on 2020/8/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = HomeViewController()
        let nav = UINavigationController(rootViewController: rootVC)
        
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }




}

