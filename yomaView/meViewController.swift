//
//  meViewController.swift
//  yomaView
//
//  Created by 任茗赫 on 2017/6/4.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

class meViewController: UIViewController {

    
    @IBOutlet weak var userName: UILabel!    // 用户名
    @IBAction func singoIn(_ sender: UIButton) {    // 注册按钮
        let singoNav = UINavigationController(rootViewController: singoInViewController());
        
        self.navigationController?.present(singoNav, animated: true, completion: nil);
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {    // 登录按钮
        self.navigationController?.pushViewController(loginViewController(), animated: true);
    }
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var singoInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "我的";
        self.tabBarController?.tabBar.backgroundColor = UIColor.white;
        // Do any additional setup after loading the view.
        
        // 接收到注册成功通知
        let notificationName = NSNotification.Name(rawValue: "dismissSingoView");
        NotificationCenter.default.addObserver(self, selector: #selector(showUserInfo(notification:)), name: notificationName, object: nil);
        
        // 接收到登录成功通知
        let loginSuccessMsg = NSNotification.Name(rawValue: "loginSuccess");
        NotificationCenter.default.addObserver(self, selector: #selector(showUserInfo(notification:)), name: loginSuccessMsg, object: nil);
        
        // 验证用户登录状态
        self.chickUserSession();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 接收到注册成功后处理函数
    func showUserInfo(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject];
        userName.text = userInfo["userName"] as? String;
        self.loginButton.isHidden = true;
        self.singoInButton.isHidden = true;
    }
    
    // 接收到登录成功后处理函数
    func handleLoginSuccess(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject];
        userName.text = userInfo["userName"] as? String;
        self.loginButton.isHidden = true;
        self.singoInButton.isHidden = true;
    }
    
    // 验证用户登录状态
    func chickUserSession() {
        let userName = UserDefaults.standard.value(forKey: "userName") as? String;
        if (!(userName?.isEmpty)!) {
            self.userName.text = userName;
            self.loginButton.isHidden = true;
            self.singoInButton.isHidden = true;
        }
        
    }
    
    // 移除通知监听
    deinit {
        NotificationCenter.default.removeObserver(self)
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
