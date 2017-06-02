//
//  ViewController2.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 6/2/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import Hero

class ViewController2: UIViewController {
    fileprivate var blackView: UIView!
    fileprivate var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackView = UIView()
        blackView.backgroundColor = .black
        blackView.heroID = "batMan"
        
        whiteView = UIView()
        whiteView.backgroundColor = .white
//        whiteView.heroID = "white"
//        whiteView.heroModifiers = [.translate(y:50)]
        
        
        view.backgroundColor = .red
        view.heroID = "ironMan"
        
        isHeroEnabled = true
        
        let rootLayout = YGLayoutView(view: view)
        
        rootLayout.sublayout(
            |blackView|.size(width: 200, height: 80).marginTop(50),
            30,
            |whiteView|.width(200).flexGrow(1)
        )
        
        rootLayout
            .crossAxis(align: .center)
        
        rootLayout.layout()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc fileprivate func handleTap() {
        dismiss(animated: true, completion: nil)
    }
}
