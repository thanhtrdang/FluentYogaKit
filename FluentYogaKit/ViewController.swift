//
//  ViewController.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let redView = UIView()
//        redView.backgroundColor = .red
//        
//        view.addSubview(redView)
//        
//        view.yoga
//            .isEnabled(true)
//            .flexDirection(.column)
//            .justifyContent(.spaceAround)
//            .alignItems(.center)
//        
//        redView.yoga
//            .isEnabled(true)
//            .size(width: 56, height: 56)
//
//        let greenView = UIView()
//        greenView.backgroundColor = .green
//        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//        
//        let bottomView = UIView()
//        bottomView.addSubview(greenView)
//        bottomView.addSubview(blueView)
//        
//        greenView.yoga
//            .isEnabled(true)
//            .size(width: 56, height: 56)
//            .marginRight(10)
//        
//        blueView.yoga
//            .isEnabled(true)
//            .size(width: 56, height: 56)
//        
//        bottomView.yoga
//            .isEnabled(true)
//            .flexDirection(.row)
//            .justifyContent(.center)
//            .alignItems(.center)
////            .alignSelf(.flexEnd)
//        
//        view.addSubview(bottomView)
//        
//        view.yoga.applyLayout(preservingOrigin: true)
        
        
        let redView = UIView()
        let greenView = UIView()
        let blueView = UIView()

        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue

        
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
        
        let redLayout = YGLayoutView(view: redView)
        let greenLayout = YGLayoutView(view: greenView)
        let blueLayout = YGLayoutView(view: blueView)
        
        let bottomLayout = YGLayoutElement(horizontal: greenLayout, blueLayout)
        let rootLayout = YGLayoutView(view: view, vertical: redLayout, bottomLayout)
        
        rootLayout
            .isEnabled(true)
            .mainAxis(.spaceBetween)
            .crossAxis(.center)
        
        redLayout
            .isEnabled(true)
            .size(width: 56, height: 56)
        greenLayout
            .isEnabled(true)
            .size(width: 56, height: 56)
            .marginRight(10)
        blueLayout
            .isEnabled(true)
            .size(width: 56, height: 56)

        bottomLayout
            .isEnabled(true)
            .mainAxis(.center)
            .crossAxis(.center)
//            .crossSelf(.flexEnd)
            .marginBottom(30)
        
        rootLayout.layout()
        
        print("blah")
    }

    
}
