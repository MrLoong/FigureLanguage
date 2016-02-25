//
//  ManageDocument.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/9/19.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class ManageDocument: UIViewController,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate{
    
    var tit:Array<AnyObject> = []
    var textString :String!
    var refreshControl = UIRefreshControl()

    @IBOutlet weak var setTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "文档管理"
        setTable.dataSource = self
        setTable.delegate = self
        setTable.tableFooterView = UIView()
        
        self.refreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl.attributedTitle = NSAttributedString(string: "刷新")
        self.setTable.addSubview(refreshControl)
        
        
        self.tit = ManageDataBase.searchdata()
        
        


        // Do any additional setup after loading the view.
    }
    
    func refreshData() {
        
        println("成功触发刷新")
        self.tit = ManageDataBase.searchdata()
        
        self.setTable.reloadData()
        
        self.refreshControl.endRefreshing()
        
    }

    @IBAction func chufa(sender: AnyObject) {
        
        ManageDataBase.addData("你好",withText:"成功了")
        ManageDataBase.searchdata()
        //self.performSegueWithIdentifier("showManageView", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var message : Message = tit[indexPath.row] as! Message
        
//        let viewController = Common.rootViewController
//        viewController.homeViewController.titleOfOtherPages = message.getTitle()
        
        textString = message.getText()
        
        self.performSegueWithIdentifier("showManageView", sender: self)
//        switch indexPath.row
//        {
//        case 0:
//            viewController.homeViewController.performSegueWithIdentifier("tutu", sender: self);                                        ller.performSegueWithIdentifier("ab", sender: self);
//        default:
//            viewController.homeViewController.performSegueWithIdentifier("ab", sender: self);
//            
//        }
        deleteView()
//        viewController.mainTabBarController.tabBar.hidden = true
//        viewController.mainTabBarController.selectedIndex = 0
//        viewController.showHome()
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tit.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var message : Message = tit[indexPath.row] as! Message
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = message.getTitle()        
        
        return cell
    }
    
    
    func deleteView(){
//        Common.contactsVC.view.removeFromSuperview()
//        //Common.localPhoto.view.removeFromSuperview()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "showManageView" {
            if let a = segue.destinationViewController as? ManageDocumentView {
                a.text = self.textString
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
