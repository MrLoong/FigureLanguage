//
//  Common.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class Common: NSObject {
    
    static let screenWidth = UIScreen.mainScreen().applicationFrame.maxX
    static let screenHight = UIScreen.mainScreen().applicationFrame.maxY
    static let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController as! ViewController
    static let contactsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Contacts") as! UIViewController
    static let localPhoto = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("photo") as! UIViewController
   // static let localCamera = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("longshao") as! UIViewController
    
    static let photoNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("photoNavigation") as! UINavigationController
    static let long = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("documentNavigation") as! UINavigationController
    
    // static let home = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeNavigationController") as! UIViewController
   
}
