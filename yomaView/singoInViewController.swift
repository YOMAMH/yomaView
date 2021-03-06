//
//  singoInViewController.swift
//  yomaView
//
//  Created by renminghe on 2017/6/1.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit
let shareNetwork = NetworkManager.shared;
let Domain = "http://127.0.0.1:9090/";
var USER_NAME = "";
var PASS_WORD = "";

class singoInViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var singoInSuccess: UILabel!
    
    @IBAction func canlceBtn(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil);
    }
    @IBOutlet weak var singIn: UIButton!
    
    @IBOutlet weak var loding: UIActivityIndicatorView!
    @IBAction func singoInBtn(_ sender: UIButton) {    // 注册
        USER_NAME = userName.text!;
        PASS_WORD = passWord.text!;
        self.view.endEditing(true);
        self.loding.startAnimating();
        if (!USER_NAME.isEmpty && !PASS_WORD.isEmpty) {
            shareNetwork.request(requestType: HTTPRequestMethod.POST, urlString: Domain.appending("user/singoIn"), parameters: ["user": USER_NAME as AnyObject, "password": PASS_WORD as AnyObject]) { (res) in
                 self.loding.alpha = 0;
                self.loding.stopAnimating();
            
                var User : AnyObject? = nil;
                User = res?["Date"] as AnyObject;
                User = User?[0] as AnyObject
                let user = User?["UserName"]! as! String;
                print(user);
                self.sendMsg(name: user);
                self.singoInSuccess.alpha = 1;
                sleep(2);
                
                self.navigationController?.dismiss(animated: true, completion: {
                    self.singoInSuccess.alpha = 0;
                });
            
            }
        } else {
            self.loding.stopAnimating();
            self.alert(message: "用户名或密码不能为空!");
        }
        
        
        
    }
    
    @IBAction func loginInBtn(_ sender: UIButton) {

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // 初始化空间样式
        self.initElementStyle();
        
        // 注册通知
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 初始化样式
    func initElementStyle() {
        self.title = "注册";
        singIn.layer.borderWidth = 1;
        singIn.layer.borderColor = (UIColor(red: 0x5D/255, green: 0x97/255, blue: 0xC8/255, alpha: 1)).cgColor;
        self.loding.stopAnimating();
    }
    
    // alert
    func alert(message: String) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.cancel, handler: nil);
        
        alertController.addAction(okAction);
        
        self.present(alertController, animated: true, completion: nil);
    }
    
    // 发送通知
    func sendMsg(name: String)  {
        let notificationName = Notification.Name(rawValue: "dismissSingoView");
        NotificationCenter.default.post(name: notificationName, object: self, userInfo: ["userName":name]);
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
