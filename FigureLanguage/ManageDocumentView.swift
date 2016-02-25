//
//  ManageDocumentView.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/9/20.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class ManageDocumentView: UIViewController {
    
    var text:String!
    
    @IBOutlet weak var OK: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "文档选项"
        let backButton = UIBarButtonItem(title: "く返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        self.navigationItem.leftBarButtonItem = backButton
        
        self.OK.text = self.text

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func readView(sender: AnyObject) {
        
//        let view = Common.photoNavigation
//        view.performSegueWithIdentifier("ocrText", sender: self)
        
        
        self.performSegueWithIdentifier("read", sender: self)
    }
    
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
        Common.rootViewController.mainTabBarController.tabBar.hidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "read" {
            if let a = segue.destinationViewController as? TTSUIController {
                a.text = self.text
            }
        }
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
