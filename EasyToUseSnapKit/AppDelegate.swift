//
//  AppDelegate.swift
//  EasyToUseSnapKit
//
//  Created by Shun Tedokon on 11/20/16.
//  Copyright © 2016 Shun Tedokon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setRootViewController()
        
        return true
    }
    
    fileprivate func setRootViewController() -> Void {
        window = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = TabBarController()
            window.backgroundColor = .white
            window.makeKeyAndVisible()
            return window
        }()
    }

}

