//
//  AppDelegate.swift
//  finance-app2
//
//  Created by Darrow Hartman on 12/31/19.
//  Copyright © 2019 Darrow Hartman. All rights reserved.
//
import UIKit
import Firebase
import SwiftUI
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert,.badge,.sound]) { (granted, err) in
        print("granted \(granted)")
        print("err \(err)")
    }
    center.getNotificationSettings { settings in
        guard settings.authorizationStatus == .authorized else { return }

        if settings.alertSetting == .enabled {
            // Schedule an alert-only notification.
        } else {
            // Schedule a notification with a badge and sound.
        }
    }
    
    return true
  }
// MARK: UISceneSession Lifecycle

func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    
    
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
}

func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    
    
    
    
}
}


