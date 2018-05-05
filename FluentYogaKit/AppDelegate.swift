//
//  AppDelegate.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import FluentSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")!.load()

    window = UIWindow(frame: UIScreen.main.bounds).then {
      $0.backgroundColor = .white
      $0.rootViewController = ViewController1()
      $0.makeKeyAndVisible()
    }

    return true
  }
}
