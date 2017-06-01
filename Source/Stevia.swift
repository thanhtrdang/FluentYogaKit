//
//  Hierarchy.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/31/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import yoga

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

// MARK: - subnode -
extension YGNodeRef {
    @discardableResult
    internal func subnode(_ subnodes: YGNodeRef...) -> YGNodeRef {
        return subnode(subnodes)
    }
    
    @discardableResult
    internal func subnode(_ subnodes: [YGNodeRef]) -> YGNodeRef {
        insertChildren(children: subnodes)
        
        return self
    }
}

// MARK: - subelement -
extension YGLayoutElement {
    @discardableResult
    internal func subelement(_ subelements: YGLayoutElement...) -> Self {
        return subelement(subelements)
    }
    
    @discardableResult
    internal func subelement(_ subelements: [YGLayoutElement]) -> Self {
        node.subnode(
            subelements
                .filter {
                    $0.isEnabled && $0.isIncluded
                }
                .map {
                    $0.node
                }
        )
        self.subelements.append(contentsOf: subelements)
        
        return self
    }
}

// MARK: - sublayout -
public extension YGLayoutElement {
    public func style(mainAxis: YGJustify = .flexStart, crossAxis: YGAlign = .stretch) -> Self {
        containerStyle = YGLayoutContainerStyle(mainAxis: mainAxis, crossAxis: crossAxis)
        
        return self
    }

    @discardableResult
    fileprivate func handleRightSide(_ rightSide: RightSide) -> Self {
        marginRight = rightSide.margin
        containerStyle = rightSide.containerStyle
        
        return self
    }
    
    fileprivate func handleStyle() -> Self {
        if let style = subelements.last?.containerStyle {
            mainAxis(align: style.mainAxis)
            crossAxis(align: style.crossAxis)
            subelements.last?.containerStyle = nil
        }
        
        return self
    }
}
/*
 let rootLayout = YGLayoutView(view: view)
    .sublayout(
        |-20-titleLabel|.crossSelf(align: .flexStart),
        30,
        YGLayoutView(view: formView).sublayout(
            usernameLabel,
            8,
            usernameTextField,
            16,
            passwordLabel,
            8,
            passwordTextField,
            16,
            |forgotPasswordButton-signInButton|.style(mainAxis: .spaceBetween)
        ).flexGrow(1),
        |signUpLabel-4-signUpButton|.style(mainAxis: .center)
    )
 
 rootLayout
    .isEnabled(true)
    .paddingTop(44)
    .paddingHorizontal(16)
    .paddingBottom(12)
 
 rootLayout.layout { [unowned self] layoutView in
    // config something that must run after layout, e.g. build bottom border.
    self.usernameTextField.border(sides: .bottom)
 }
*/
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
        let layoutView = YGLayoutView(view: subview)
        
        view.subview(subview)
        
        subelement(layoutView)
    }
    
    private func handleSublayout(horizontal subviews: [UIView]) {
        let sublayoutViews = subviews.map { YGLayoutView(view: $0) }
        let subelement = YGLayoutElement(horizontal: sublayoutViews)

        view.subview(subviews)
        
        self.subelement(subelement)
    }
    
    private func handleSublayout(sublayoutView: YGLayoutView) {
        view.subview(sublayoutView.view)
        
        subelement(sublayoutView)
    }
    
    private func handleSublayout(horizontal sublayoutViews: [YGLayoutView]) {
        view.subview(sublayoutViews.map { $0.view })
        
        let subelement = YGLayoutElement(horizontal: sublayoutViews)
            .handleStyle()
        
        self.subelement(subelement)
    }

    private func handleSublayout(sublayoutElement: YGLayoutElement) {
        
        subelement(sublayoutElement)
    }

    private func handleSublayout(horizontal sublayoutElements: [YGLayoutElement]) {
        let subelement = YGLayoutElement(horizontal: sublayoutElements)
            .handleStyle()
        
        self.subelement(subelement)
    }
    
}

//MARK: - container style -
/*
 Support more styles:
 Step 1: Add more properties to YGLayoutContainerStyle, only "set on containers" properties in comments of Fluent.swift
 Step 2: Update RightSide.style
 Step 3: Update YGLayoutElement.style, YGLayoutElement.handleStyle
 Step 4: Use, e.g. as in ViewController.swift
 
 */
internal struct YGLayoutContainerStyle {
    fileprivate let mainAxis: YGJustify
    fileprivate let crossAxis: YGAlign
}

public class RightSide {
    fileprivate let margin: Float
    fileprivate var containerStyle: YGLayoutContainerStyle?
    
    fileprivate init(margin: Float) {
        self.margin = margin
    }
    
    public func style(mainAxis: YGJustify = .flexStart, crossAxis: YGAlign = .stretch) -> Self {
        containerStyle = YGLayoutContainerStyle(mainAxis: mainAxis, crossAxis: crossAxis)
        
        return self
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
private let defaultMargin = Float(8)

@discardableResult
public prefix func |- (left: Float) -> Float {
    return left
}
@discardableResult
public prefix func |- (view: UIView) -> YGLayoutView {
    return YGLayoutView(view: view).marginLeft(defaultMargin)
}
@discardableResult
public prefix func |- (layoutElement: YGLayoutElement) -> YGLayoutElement {
    return layoutElement.marginLeft(defaultMargin)
}

// MARK: postfix -|
@discardableResult
public postfix func -| (right: Float) -> RightSide {
    return RightSide(margin: right)
}
@discardableResult
public postfix func -| (view: UIView) -> YGLayoutView {
    return YGLayoutView(view: view).marginRight(defaultMargin)
}
@discardableResult
public postfix func -| (layoutElement: YGLayoutElement) -> YGLayoutElement {
    return layoutElement.marginRight(defaultMargin)
}

// MARK: func '-'
public func - (left: Float, right: UIView) -> YGLayoutView {
    return YGLayoutView(view: right).marginLeft(left)
}
public func - (left: Float, right: YGLayoutElement) -> YGLayoutElement {
    return right.marginLeft(left)
}
public func - (left: Float, right: [YGLayoutElement]) -> [YGLayoutElement] {
    right.first?.marginLeft(left)
    return right
}

public func - (left: UIView, right: RightSide) -> YGLayoutView {
    return YGLayoutView(view: left).handleRightSide(right)
}
public func - (left: YGLayoutElement, right: RightSide) -> YGLayoutElement {
    return left.handleRightSide(right)
}
public func - (left: [YGLayoutElement], right: RightSide) -> [YGLayoutElement] {
    left.last?.handleRightSide(right)
    
    return left
}

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
