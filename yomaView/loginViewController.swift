//
//  loginViewController.swift
//  yomaView
//
//  Created by renminghe on 2017/6/5.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    
    @IBOutlet weak var loding: UIActivityIndicatorView!
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBAction func loginBtn(_ sender: UIButton) {
        if (!(self.userName.text?.isEmpty)! && !(self.passWord.text?.isEmpty)!) {
            self.loding.startAnimating();
            let userName = self.userName.text;
            let passWord = self.passWord.text;
            shareNetwork.request(requestType: HTTPRequestMethod.POST, urlString: Domain.appending("user/login"), parameters: ["userName": userName as AnyObject, "passWord": passWord as AnyObject], completion: { (res) in
                var User : AnyObject? = nil;
                self.loding.stopAnimating();
                if ((res?["Date"]) != nil) {
                    User = res?["Date"] as AnyObject;
                    User = User?[0] as AnyObject
                    let user = User?["UserName"]! as! String;
                    let pass = User?["PassWord"]! as! String;
                   
                    if (!user.isEmpty && !pass.isEmpty) {    // 用户存在,存储用户名密码
                        UserDefaults.standard.set(user, forKey: "userName");
                        UserDefaults.standard.set(pass, forKey: "passWord");
                        
                        // 设置同步
                        UserDefaults.standard.synchronize();
                        
                        // 发送通知
                        self.sendMsg(name: user);
                        
                        // 返回上级页面
                        sleep(2);
                        self.navigationController?.popViewController(animated: true);
                        
                    } else {
                        self.alert(message: "用户名或密码错误")
                    }

                } else {
                    self.loding.stopAnimating();
                    self.alert(message: "获取用户数据失败")
                }
               
            })
        }else {
            self.alert(message: "用户名或密码不能为空")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loding.stopAnimating();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // alert
    func alert(message: String) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.cancel, handler: nil);
        
        alertController.addAction(okAction);
        
        self.present(alertController, animated: true, completion: nil);
    }
    
    // 发送通知
    func sendMsg(name: String) {
        let msg = NSNotification.Name("loginSuccess");
        NotificationCenter.default.post(name: msg, object: self, userInfo: ["userName": name]);
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
