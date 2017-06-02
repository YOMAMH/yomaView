//
//  ViewController.swift
//  yomaView
//
//  Created by renminghe on 2017/5/31.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func click(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let sharedTools = NetworkManager.shared;
        sharedTools.request(requestMethod: HTTPRequestMethod.GET, urlString: "http://127.0.0.1:9090/json", parameters: nil) { (res) in
            print(res);
        }
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

