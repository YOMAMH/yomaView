//
//  AppDelegate.swift
//  yomaView
//
//  Created by renminghe on 2017/5/31.
//  Copyright © 2017年 renminghe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds);
        let mainTab = mainTabbarController();
        mainTab.tabBar.backgroundColor = UIColor.white;
        let meVc = meViewController();
        let homeVc = homeTableViewController();
        let channelVc = UIViewController();
        let playVc = UIViewController();
        let roundVc = UIViewController();
       
        let meNavVc = meNav(rootViewController: meVc);
        let homeNavVc = homeNavViewController(rootViewController: homeVc);
        homeVc.tabBarItem=UITabBarItem(
            title: "首页",
            image: UIImage(named: "home.png"),
            selectedImage: UIImage(named: "home.png")
        );
        channelVc.tabBarItem=UITabBarItem(
            title: "频道",
            image: UIImage(named: "channel.png"),
            selectedImage: UIImage(named: "channel.png")
        );
        playVc.tabBarItem=UITabBarItem(
            title: "直播",
            image: UIImage(named: "play.png"),
            selectedImage: UIImage(named: "play.png")
        );
        roundVc.tabBarItem=UITabBarItem(
            title: "排行",
            image: UIImage(named: "round.png"),
            selectedImage: UIImage(named: "round.png")
        );
        meNavVc.tabBarItem=UITabBarItem(
            title: "我的",
            image: UIImage(named: "me.png"),
            selectedImage: UIImage(named: "me.png")
        );
       
        
        mainTab.viewControllers = [homeNavVc, channelVc, playVc, roundVc, meNavVc];
        self.window?.rootViewController = mainTab;
        self.window?.makeKeyAndVisible();
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

