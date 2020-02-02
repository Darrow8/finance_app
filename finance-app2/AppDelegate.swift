//
//  AppDelegate.swift
//  finance-app2
//
//  Created by Darrow Hartman on 12/31/19.
//  Copyright © 2019 Darrow Hartman. All rights reserved.
//
import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
