//
//  Hierarchy.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/31/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit

// Ref: https://github.com/freshOS/Stevia
// MARK: subview -
/*
 E.g. Build a sign-in form
 formView.subview(
    usernameLabel,
    usernameTextField,
    passwordLabel,
    passwordTextField,
    buttonsView.subview(
        forgotPasswordButton, signInButton
    )
 )
 */
public extension UIView {
    @discardableResult
    public func subview(_ subviews: UIView...) -> UIView {
        return subview(subviews)
    }
    
    @discardableResult
    public func subview(_ subviews: [UIView]) -> UIView {
        subviews.forEach {
            addSubview($0)
        }
        return self
    }
}

public extension UITableViewCell {
    @discardableResult
    public override func subview(_ subviews: [UIView]) -> UIView {
        return contentView.subview(subviews)
    }
}

public extension UICollectionViewCell {
    @discardableResult
    public override func subview(_ subviews: [UIView]) -> UIView {
        return contentView.subview(subviews)
    }
}

// MARK: - sublayout -
public extension YGLayoutElement {
    fileprivate func handleAdditionalStyle() -> Self {
        if let additionalStyle = subelements.last?.yoga {
            mainAxis(align: additionalStyle.mainAxisAlign)
            crossAxis(align: additionalStyle.crossAxisAlign)
            yoga = nil
        }
        
        return self
    }
}

public extension YGLayoutView {
    public func sublayout(_ sublelements: Any...) -> Self {
        flexDirection(.column)
        
        var marginTop: Float? = nil
        for (index, subelement) in sublelements.enumerated() {
            switch subelement {
            case let subview as UIView:
                handleSublayout(subview: subview)
                
            case let subviews as [UIView]:
                handleSublayout(horizontal: subviews)
                
            case let sublayoutView as YGLayoutView:
                handleSublayout(sublayoutView: sublayoutView)
                
            case let sublayoutViews as [YGLayoutView]:
                handleSublayout(horizontal: sublayoutViews)
                
            case let sublayoutElement as YGLayoutElement:
                handleSublayout(sublayoutElement: sublayoutElement)
                
            case let sublayoutElements as [YGLayoutElement]:
                handleSublayout(horizontal: sublayoutElements)
                
            // case _ as String:() //Do nothin' !
            case is Int: fallthrough
            case is Double: fallthrough
            case is CGFloat:
                if index == 0 {
                    marginTop = Float(any: subelement)
                } else {
                    handleSublayout(marginBottom: Float(any: subelement))
                }
            default:
                print("Don't support \(index) - \(subelement) yet.")
            }
        }
        
        handleSublayout(marginTop: marginTop)
        
        return self
    }
    
    private func handleSublayout(marginTop: Float?) {
        if let marginTop = marginTop, let firstSubelement = subelements.first {
            firstSubelement.marginTop(marginTop)
        }
    }

    private func handleSublayout(marginBottom: Float) {
        if let previousSubelement = subelements.last {
            previousSubelement.marginBottom(marginBottom)
        }
    }

    private func handleSublayout(subview: UIView) {
        view.subview(subview)
        
        subelements.append(YGLayoutView(view: subview))
    }
    
    private func handleSublayout(horizontal subviews: [UIView]) {
        view.subview(subviews)
        
        let sublayoutViews = subviews.map { YGLayoutView(view: $0) }
        let subelement = YGLayoutElement(horizontal: sublayoutViews)
        subelements.append(subelement)
    }
    
    private func handleSublayout(sublayoutView: YGLayoutView) {
        view.subview(sublayoutView.view)
        
        subelements.append(sublayoutView)
    }
    
    private func handleSublayout(horizontal sublayoutViews: [YGLayoutView]) {
        view.subview(sublayoutViews.map { $0.view })
        
        let subelement = YGLayoutElement(horizontal: sublayoutViews)
            .handleAdditionalStyle()
        
        subelements.append(subelement)
    }

    private func handleSublayout(sublayoutElement: YGLayoutElement) {
        subelements.append(sublayoutElement)
    }

    private func handleSublayout(horizontal sublayoutElements: [YGLayoutElement]) {
        let subelement = YGLayoutElement(horizontal: sublayoutElements)
            .handleAdditionalStyle()
        
        subelements.append(subelement)
    }
    
}

// MARK: - operators -
prefix operator |
prefix operator |-
postfix operator |
postfix operator -|

// MARK: | prefix
@discardableResult
public prefix func | (view: UIView) -> YGLayoutView {
    return YGLayoutView(view: view)
}
@discardableResult
public prefix func | (layoutElement: YGLayoutElement) -> YGLayoutElement {
    return layoutElement
}
// MARK: postfix |
@discardableResult
public postfix func | (view: UIView) -> YGLayoutView {
    return YGLayoutView(view: view)
}
@discardableResult
public postfix func | (layoutElement: YGLayoutElement) -> YGLayoutElement {
    return layoutElement
}

// MARK: |- prefix
@discardableResult
public prefix func |- (view: UIView) -> YGLayoutView {
    return YGLayoutView(view: view).marginLeft(8)
}
@discardableResult
public prefix func |- (layoutElement: YGLayoutElement) -> YGLayoutElement {
    return layoutElement.marginLeft(8)
}

// MARK: postfix -|
@discardableResult
public postfix func -| (view: UIView) -> YGLayoutView {
    return YGLayoutView(view: view).marginRight(8)
}
@discardableResult
public postfix func -| (layoutElement: YGLayoutElement) -> YGLayoutElement {
    return layoutElement.marginRight(8)
}

// MARK: func '-'
public func - (left: UIView, right: Float) -> YGLayoutView {
    return YGLayoutView(view: left).marginRight(right)
}
public func - (left: YGLayoutElement, right: Float) -> YGLayoutElement {
    return left.marginRight(right)
}
public func - (left: [YGLayoutElement], right: Float) -> [YGLayoutElement] {
    left.last?.marginRight(right)
    return left
}

public func - (left: UIView, right: UIView) -> [YGLayoutElement] {
    return [YGLayoutView(view:left), YGLayoutView(view: right)]
}
public func - (left: YGLayoutElement, right: YGLayoutElement) -> [YGLayoutElement] {
    return [left, right]
}
public func - (left: UIView, right: YGLayoutElement) -> [YGLayoutElement] {
    return [YGLayoutView(view: left), right]
}
public func - (left: YGLayoutElement, right: UIView) -> [YGLayoutElement] {
    return [left, YGLayoutView(view: right)]
}
