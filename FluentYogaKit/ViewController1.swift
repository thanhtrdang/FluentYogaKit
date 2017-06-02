//
//  ViewController1.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 6/2/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import Hero

class ViewController1: UIViewController {
    fileprivate var blackView: UIView!
    fileprivate var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blackView = UIView()
        blackView.backgroundColor = .black
        blackView.heroID = "batMan"
        
        redView = UIView()
        redView.backgroundColor = .red
        redView.heroID = "ironMan"
        
        view.backgroundColor = .white
//        view.heroID = "white"
        isHeroEnabled = true
        
        
        let rootLayout = YGLayoutView(view: view)
        
        rootLayout.sublayout(
            blackView,
            30,
            redView
        )
        
        rootLayout
            .mainAxis(align: .center)
            .crossAxis(align: .center)
        
        rootLayout[0]!
            .size(width: 200, height: 80)
        
        rootLayout[1]!
            .size(width: 200, height: 200)
        
        rootLayout.layout()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc fileprivate func handleTap() {
        present(ViewController2(), animated: true, completion: nil)
    }

}
