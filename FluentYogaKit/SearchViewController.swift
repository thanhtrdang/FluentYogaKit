//
//  SearchViewController.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 6/15/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import YetAnotherAnimationLibrary

import FluentSwift

class SearchViewController: UIViewController {
    fileprivate var backButton: UIButton!
    fileprivate var clearButton: UIButton!
    fileprivate var searchButton: UIButton!
    
    fileprivate var anywhereIcon: UIImageView!
    fileprivate var anytypeIcon: UIImageView!
    fileprivate var anypriceIcon: UIImageView!
    
    fileprivate var anywhereButton: UIButton!
    fileprivate var anytypeButton: UIButton!
    fileprivate var anypriceButton: UIButton!
    
    fileprivate var resultTypeButton: UIButton!
    fileprivate var filterButton: UIButton!
    fileprivate var optionButton: UIButton!

    fileprivate var headerView: UIView!
    fileprivate var isCollapsed = true
    fileprivate var collapsedLayout: YGLayout!
    fileprivate var expandedLayout: YGLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configNav()
        config3Filters()
        configOptions()
        
        configLayout()
    }

    fileprivate func configNav() {
        backButton = UIButton().image(#imageLiteral(resourceName: "back"))
        
        clearButton = UIButton()
            .title("Clear all")
            .font(.h5)
            .color(.black)
            .color(.lightGray, for: .highlighted)
        
        searchButton = UIButton()
            .title("Anywhere 𐄁 Anytype 𐄁 Anyprice")
            .font(.h5)
            .align(horizontal: .left)
            .color(.black)
            .color(.lightGray, for: .highlighted)
    }
    
    fileprivate func config3Filters() {
        anywhereIcon = UIImageView(image: #imageLiteral(resourceName: "anywhere"))
        anywhereButton = UIButton()
            .title("Anywhere")
            .font(.h5)
            .color(.black)
            .color(.lightGray, for: .highlighted)
            .align(horizontal: .left)
        
        anytypeIcon = UIImageView(image: #imageLiteral(resourceName: "anytype"))
        anytypeButton = UIButton()
            .title("Anytype")
            .font(.h5)
            .color(.black)
            .color(.lightGray, for: .highlighted)
            .align(horizontal: .left)
        
        anypriceIcon = UIImageView(image: #imageLiteral(resourceName: "anyprice"))
        anypriceButton = UIButton()
            .title("Anyprice")
            .font(.h5)
            .color(.black)
            .color(.lightGray, for: .highlighted)
            .align(horizontal: .left)
    }
    
    fileprivate func configOptions() {
        resultTypeButton = UIButton()
            .image(#imageLiteral(resourceName: "list"))
        
        filterButton = UIButton()
            .image(#imageLiteral(resourceName: "filter"))
        
        optionButton = UIButton()
            .image(#imageLiteral(resourceName: "more"))
    }
    
    fileprivate func configLayout() {
        headerView = UIView()
            .subview(
                backButton,
                searchButton,
                clearButton,
                
                anywhereIcon, anywhereButton
                //            ,
                //            anytypeIcon, anytypeButton,
                //            anypriceIcon, anypriceButton,
                //
                //            resultTypeButton, filterButton, optionButton
            )
            .fill(color: .lightGray)
        
        view.subview(
            headerView
        )
        
        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggle)))
        headerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(pan(gr:))))

        collapsedLayout = headerView.yoga.vTop(
            YGLayout.hStart(vAlign: .center, backButton.yoga.width(24).aspectRatio(1), 8, searchButton.yoga.flexGrow(1))
                .height(44)
                .marginTop(20)
                .marginHorizontal(10)
        )
        
        expandedLayout = headerView.yoga.vTop(
            YGLayout.hSpace(vAlign: .center, backButton.yoga.width(24).aspectRatio(1), clearButton)
                .height(44)
                .marginTop(20)
                .marginHorizontal(10),
            YGLayout.hStart(vAlign: .center, anywhereIcon.yoga.width(24).aspectRatio(1), 8, anywhereButton.yoga.flexGrow(1))
                .marginHorizontal(10)
                .marginBottom(12)
        )
        
        collapsedLayout.calculate(constrainedSize: CGSize(width: Screen.width, height: .cgUndefined))
        expandedLayout.calculate(constrainedSize: CGSize(width: Screen.width, height: .cgUndefined))        

        collapse()
    }
    
    @objc fileprivate func pan(gr: UIPanGestureRecognizer) {
        let translation = gr.translation(in: view)
        let velocity = gr.velocity(in: view)
//        let newCenter = CGPoint(x: headerView.center.x, y: headerView.center.y + velocity.y)

        let newSize = CGSize(width: headerView.frame.size.width, height: headerView.frame.size.height + velocity.y / 100)
        
        switch gr.state {
        case .began:
            fallthrough
        case .changed:
            print("changed y: \(translation.y) - \(velocity.y)")
            if collapsedLayout.frame.height <= newSize.height && newSize.height <= expandedLayout.frame.height {
                headerView.yaal.frame.setTo(CGRect(origin: headerView.frame.origin, size: newSize))
            }
        default:
            let midSize = CGSize(width: headerView.frame.size.width, height: 0.5 * (expandedLayout.frame.height + collapsedLayout.frame.height))

            if newSize.height >= midSize.height && !isCollapsed {
                headerView.yaal.frame.animateTo(expandedLayout.frame)
            } else if newSize.height < midSize.height && isCollapsed {
                headerView.yaal.frame.animateTo(collapsedLayout.frame)
            } else {
                toggle()
            }
            
            print("end y: \(translation.y) - \(velocity.y)")
        }
    }
    
    @objc fileprivate func toggle() {
        isCollapsed = !isCollapsed

        print("Toggle!!! \(isCollapsed)")

        if isCollapsed {
            collapse()
        } else {
            expand()
        }
    }
    
    fileprivate func collapse() {
        searchButton.yaal.alpha.animateTo(1.0)
        
        clearButton.yaal.alpha.animateTo(0.0)
        anywhereIcon.yaal.alpha.animateTo(0.0)
        anywhereButton.yaal.alpha.animateTo(0.0)
        
        collapsedLayout.apply()
    }
    
    fileprivate func expand() {
        searchButton.yaal.alpha.animateTo(0.0)
        
        clearButton.yaal.alpha.animateTo(1.0)
        anywhereIcon.yaal.alpha.animateTo(1.0)
        anywhereButton.yaal.alpha.animateTo(1.0)

        expandedLayout.apply()
    }
}
