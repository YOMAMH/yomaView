//
//  meViewController.swift
//  yomaView
//
//  Created by renminghe on 2017/6/1.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

class meViewController: UIViewController {

    @IBAction func loginBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func singInBtn(_ sender: UIButton) {
        let singoNav = UINavigationController(rootViewController: singoInViewController());
    
        self.navigationController?.present(singoNav, animated: true, completion: nil);
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "我的";
        // Do any additional setup after loading the view.
        
        let notificationName = NSNotification.Name(rawValue: "dismissSingoView");
        NotificationCenter.default.addObserver(self, selector: #selector(showUserInfo(notification:)), name: notificationName, object: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showUserInfo(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject];
        print(userInfo["userName"]!);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
