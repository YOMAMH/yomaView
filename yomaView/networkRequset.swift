//
//  networkRequset.swift
//  yomaView
//
//  Created by renminghe on 2017/5/31.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import Foundation
import AFNetworking

enum WHRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

class WHNetworkTools: AFHTTPSessionManager {
    
    // 单例
    static let sharedTools: WHNetworkTools = {
        let instance = WHNetworkTools();
        return instance
    }()
    
    // (response: AnyObject?, error: NSError?)->()
    // 定义请求完成的回调的别名
    typealias WHRequestCallBack = (_ response: AnyObject?, _ error: NSError?)->()
    
    /// 请求数据
    ///
    /// - parameter urlString:  请求地址
    /// - parameter parameters: 请求参数
    /// - parameter finished:   请求成功或者失败的回调
    func request(method: WHRequestMethod = .GET, urlString: String, parameters: AnyObject?, finished:@escaping WHRequestCallBack){
        
        // dataTaskWithHttp 是写在 .m 文件里面的
        // 对应在 Swift 中的，就是 private 修饰的方法
        
        // 定义请求成功的闭包
        let success = { (dataTask: URLSessionDataTask, responseObject: AnyObject?) -> Void in
            finished(responseObject, nil);
        }
        
        // 定义请求失败的闭包
        let failure = { (dataTask: URLSessionDataTask?, error: NSError) -> Void in
            finished(nil, error)
        }
        
        if method == .GET {
            
            get(urlString, parameters: parameters, progress: nil, success: success as? (URLSessionDataTask, Any?) -> Void, failure: failure as? (URLSessionDataTask?, Error) -> Void)
        }else{
            post(urlString, parameters: parameters, progress: nil, success: success as? (URLSessionDataTask, Any?) -> Void, failure: failure as? (URLSessionDataTask?, Error) -> Void)
        }
    }
    
    
    /// 发送请求(上传文件)
    
    func requestWithData(data: NSData, name: String, urlString: String, parameters: AnyObject?, finished:@escaping WHRequestCallBack) {
        // 定义请求成功的闭包
        let success = { (dataTask: URLSessionDataTask, responseObject: AnyObject?) -> Void in
            finished(responseObject, nil)
        }
        
        // 定义请求失败的闭包
        let failure = { (dataTask: URLSessionDataTask?, error: NSError) -> Void in
            finished(nil, error)
        }
        
        post(urlString, parameters: parameters, constructingBodyWith: { (formData) -> Void in
            formData.appendPart(withFileData: data as Data, name: name, fileName: "aa", mimeType: "application/json")
        }, progress: nil, success: success as? (URLSessionDataTask, Any?) -> Void, failure: failure as? (URLSessionDataTask?, Error) -> Void)
    }
}
