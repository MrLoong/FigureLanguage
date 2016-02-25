//
//  SendCircleFFriends.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/27.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class SendCircleFFriends: UIViewController  ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var titleName: UITextField!
    @IBOutlet weak var contentTxt: UITextField!
    
    var images : UIImage!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "分享"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
    
        OperationalCloud.saveCloud(self.contentTxt.text, over: "lastdays", over: "2015.9.9", over: self.titleName.text, over: self.images , over : "share")
    }

    @IBAction func getImage(sender: AnyObject) {
        var c = UIImagePickerController()
        c.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(c, animated: true, completion: nil)
        c.delegate = self
    }
    @IBAction func localImage(sender: AnyObject) {
        var c = UIImagePickerController()
        c.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(c, animated: true, completion: nil)
        c.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var iv:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        showImage.image = ImageSimple.imageWithImageSimple(iv, scaledToSize: CGSize(width: 500,height: 500))
        self.images = iv
//        imageString = UIImageJPEGRepresentation(ImageSimple.imageWithImageSimple(iv, scaledToSize: CGSize(width: 350,height: 350)), 1).base64EncodedStringWithOptions(.allZeros)
    }

}
