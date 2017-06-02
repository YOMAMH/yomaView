
//
//  baseTool.swift
//  yomaView
//
//  Created by renminghe on 2017/6/2.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

class baseTool: NSObject {
    var that: NSObject? = nil;
    init(this: NSObject) {
        that = this;
    }
    
    func alert(message: String){
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.cancel, handler: nil);
        
        alertController.addAction(okAction);
        
        that.presentViewController(alertController, animated: true, completion: nil);
    }
}
