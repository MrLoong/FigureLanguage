//
//  LeftViewController.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    let titlesDictionary = ["我的图片","编辑资料", "关注", "粉丝", "设置", "消息", "关于"]

    @IBOutlet weak var settingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.tableFooterView = UIView()
        
        
        self.view.frame = CGRectMake(0, 0, 320 * 0.78, Common.screenHight)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = Common.rootViewController
        //viewController.homeViewController.titleOfOtherPages = titlesDictionary[indexPath.row]
        
        switch indexPath.row
        {
        case 0:
            viewController.homeViewController.performSegueWithIdentifier("tutu", sender: self);
        case 1:
            viewController.homeViewController.performSegueWithIdentifier("okok", sender: self);
        case 2:
            viewController.homeViewController.performSegueWithIdentifier("guan", sender: self);
        case 3:
            viewController.homeViewController.performSegueWithIdentifier("fan", sender: self);
        case 4:
            viewController.homeViewController.performSegueWithIdentifier("ab", sender: self);
        case 5:
            viewController.homeViewController.performSegueWithIdentifier("ms", sender: self);
        case 6:
            viewController.homeViewController.performSegueWithIdentifier("ab", sender: self);
        default:
            viewController.homeViewController.performSegueWithIdentifier("ab", sender: self);
            
        }
        deleteView()
        
        
        
        viewController.mainTabBarController.tabBar.hidden = true
        viewController.mainTabBarController.selectedIndex = 0
        viewController.showHome()
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
 
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leftViewCell", forIndexPath: indexPath) as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = titlesDictionary[indexPath.row]
        
        return cell
    }
    func deleteView(){
        Common.contactsVC.view.removeFromSuperview()
        //Common.localPhoto.view.removeFromSuperview()
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
