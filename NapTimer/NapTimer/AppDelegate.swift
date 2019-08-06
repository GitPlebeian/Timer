//
//  AppDelegate.swift
//  NapTimer
//
//  Created by Jackson Tubbs on 8/6/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (success, error) in
            if let error = error { print(error.localizedDescription)}
            
            if success {
                print("Permission Granted")
            }
        }
        return true
    }



}

