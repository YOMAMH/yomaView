//
//  notificationTool.swift
//  yomaView
//
//  Created by renminghe on 2017/6/2.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

class NotificationTool: NSObject {
    var name: String = "";
    
    init(name: String, selector: () -> String) {
        super.init();
        
        self.name = name;
        let notificationName = NSNotification.Name(rawValue:self.name);
        NotificationCenter.default.addObserver(self, selector: #selector(<#T##@objc method#>), name: notificationName, object: nil);
        
    }
}
