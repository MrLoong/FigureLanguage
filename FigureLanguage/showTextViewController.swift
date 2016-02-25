//
//  showTextViewController.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class showTextViewController: UIViewController {
    
    @IBOutlet weak var showTextField: UITextView!
    var imageString: String!
    var wordText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.getText()
        
        //   自定义返回按钮
        let backButton = UIBarButtonItem(title: "く返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        self.navigationItem.leftBarButtonItem = backButton

        // Do any additional setup after loading the view.
    }
    @IBAction func speak(sender: AnyObject) {
    }
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
        Common.rootViewController.mainTabBarController.tabBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
