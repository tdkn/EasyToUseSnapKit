//
//  TabBarController.swift
//  EasyToUseSnapKit
//
//  Created by Shun Tedokon on 11/20/16.
//  Copyright © 2016 Shun Tedokon. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    typealias TabContents = (UIViewController, String, UIImage)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewControllers([
            (Sample01ViewController(), "Sample01", #imageLiteral(resourceName: "heart")),
            (Sample02ViewController(), "Sample02", #imageLiteral(resourceName: "heart")),
        ])
        
        tabBar.isTranslucent = false
    }
    
    fileprivate func addViewControllers(_ contents: [TabContents]) -> Void {
        var viewControllers: [UIViewController] = [UIViewController]()
        
        for (index, (controller, title, icon))
            in contents.enumerated().map({ t in (t.offset, t.element) }) {
                controller.title = title
                controller.tabBarItem.image = icon
                controller.tabBarItem.title = title
                controller.tabBarItem.tag = index
                viewControllers.append(controller)
        }
        
        setViewControllers(viewControllers, animated: true)
    }

}
