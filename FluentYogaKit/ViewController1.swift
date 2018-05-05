//
//  ViewController1.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 6/2/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import Hero
import UIKit

class ViewController1: UIViewController {
  fileprivate var blackView: UIView!
  fileprivate var redView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

    blackView = UIView()
    blackView.backgroundColor = .black
    blackView.hero.id = "batMan"

    redView = UIView()
    redView.backgroundColor = .red
    redView.hero.id = "ironMan"

    view.backgroundColor = .white
//        view.heroID = "white"
    hero.isEnabled = true

    view.subview(
      blackView,
      redView
    )

    view.yoga
      .vCenter(hAlign: .center,
               blackView.yoga
                 .size(width: 200, height: 80),
               30,
               redView.yoga
                 .size(width: 200, height: 200)
      )
      .layout()

    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
  }

  @objc fileprivate func handleTap() {
    present(ViewController2(), animated: true, completion: nil)
  }
}
