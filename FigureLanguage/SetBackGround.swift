//
//  SetBackGround.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/27.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class SetBackGround: NSObject{
    
    static func setBack(image : String,ui : UIViewController){
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.frame = UIScreen.mainScreen().bounds
        ui.view.addSubview(imageView)
    }
   
}
