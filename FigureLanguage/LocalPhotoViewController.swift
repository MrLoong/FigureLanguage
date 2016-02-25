//
//  LocalPhotoViewController.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit

class LocalPhotoViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var image: UIImageView!
    var wordText = ""
    var imageString :String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "图片"
        
        let imageView = UIImageView(image: UIImage(named: "ba"))
        imageView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(imageView)

        // Do any additional setup after loading the view.
    }


    @IBAction func getPhoto(sender: AnyObject) {
        var c = UIImagePickerController()
        c.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(c, animated: true, completion: nil)
        c.delegate = self
    }
    @IBAction func ocrText(sender: AnyObject) {
        self.performSegueWithIdentifier("ocrText", sender: self)
    }
    @IBAction func localPhoto(sender: AnyObject) {
        var c = UIImagePickerController()
        c.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(c, animated: true, completion: nil)
        c.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var iv:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        image.image = ImageSimple.imageWithImageSimple(iv, scaledToSize: CGSize(width: 500,height: 500))
        
        imageString = UIImageJPEGRepresentation(ImageSimple.imageWithImageSimple(iv, scaledToSize: CGSize(width: 350,height: 350)), 1).base64EncodedStringWithOptions(.allZeros)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ocrText" {
            if let a = segue.destinationViewController as? TTSUIController {
                
                a.imageString = self.imageString
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
