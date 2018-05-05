//
//  UIViewController+HotReloading.swift
//
//  Created by Thanh Dang on 5/5/18.
//  Copyright © 2018 Thanh Dang. All rights reserved.
//

import UIKit

/*
 Step 1: Install https://apple.co/2KEQv5W
 Step 2: Start app, and select "Open Project"
 Step 3: AppDelegate Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")!.load()
 Step 4: Import this file to the project
 Step 5: Edit and Save (CMD + S)

 DONE
 */
extension UIViewController {
  #if DEBUG // 1
    @objc func injected() { // 2
      for subview in view.subviews { // 3
        subview.removeFromSuperview()
      }

      if let sublayers = self.view.layer.sublayers {
        for sublayer in sublayers {
          sublayer.removeFromSuperlayer()
        }
      }

      viewDidLoad() // 4
    }
  #endif
}
