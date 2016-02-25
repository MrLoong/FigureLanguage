//
//  MainTabBarController.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        switch item.tag {
        case 0:
            Common.contactsVC.view.removeFromSuperview()
            Common.photoNavigation.view.removeFromSuperview()
            Common.long.view.removeFromSuperview()
           // Common.localCamera.view.removeFromSuperview()
            
        case 1:
            Common.rootViewController.mainTabBarController.view.addSubview(Common.long.view)
            Common.rootViewController.mainTabBarController.view.bringSubviewToFront(Common.rootViewController.mainTabBarController.tabBar)
            
        case 2:
            Common.photoNavigation.view.removeFromSuperview()
            
            Common.rootViewController.mainTabBarController.view.addSubview(Common.contactsVC.view)
            Common.rootViewController.mainTabBarController.view.bringSubviewToFront(Common.rootViewController.mainTabBarController.tabBar)
            
        case 3:
            Common.contactsVC.view.removeFromSuperview()
            Common.photoNavigation.view.removeFromSuperview()
            
            Common.rootViewController.mainTabBarController.view.addSubview(Common.photoNavigation.view)
            Common.rootViewController.mainTabBarController.view.bringSubviewToFront(Common.rootViewController.mainTabBarController.tabBar)
            
        default:
            break
        }
    }



}
