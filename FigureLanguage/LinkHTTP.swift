//
//  LinkHTTP.swift
//  FigureLanguage
//
//  Created by MrLoong on 15/8/24.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LinkHTTP: NSObject {
    
    static var wordText = ""
    
    static func getText(textView: UITextView ,imageString :String){
        let parameters = [
            "fromdevice":"pc",
            "clientip":"10.10.10.0",
            "detecttype":"LocateRecognize",
            "languagetype":"CHN_ENG",
            "imagetype":"1",
            "image":imageString
        ]
        
        let headers = [
            "apikey": "3863b1c6f8d1536c3e44c00e40de0ab8",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        //        let request = Alamofire.request(.POST, "http://apis.baidu.com/apistore/idlocr/ocr", parameters: parameters,headers: headers)
        //        request.responseString{ request, response, body, error in
        //            let end = CACurrentMediaTime()
        //            var content = NSString(CString: body!, encoding: NSUTF8StringEncoding)
        //            println(content)
        //
        //            }
        
        Alamofire.request(.POST, "http://apis.baidu.com/apistore/idlocr/ocr", parameters: parameters,headers: headers)
            .responseJSON { (req, res, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(req)
                    println(res)
                }
                else {
                    var json = JSON(json!)
                    
                    for var i = 0;i<json["retData"].count;++i{
                        println(json["retData"][i]["word"])
                        
                        self.wordText += json["retData"][i]["word"].string!+"\n"
                    }
                    
                }
                
                textView.text = self.wordText
                
        }
    }
   
}
