//
//  UIView.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 6/8/17.
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

  @objc @discardableResult
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

// MARK: - layout association -

// Use pattern https://github.com/ReactiveX/RxSwift/blob/master/RxSwift/Reactive.swift
// in case UIButton, UILabel, UITableView... need some customizations later.
extension UIView {
  public var yoga: YGLayout {
    return YGLayout(view: self)
  }

  // TODO: Clean it up later
//    private struct AssociatedKeys {
//        static var YogaKitKey = "YogaKit_ViewKey"
//    }
//
//    public var yoga: YGLayout {
//        var layout = objc_getAssociatedObject(self, &AssociatedKeys.YogaKitKey) as? YGLayout
//
//        if layout == nil {
//            layout = YGLayout(view: self)
//            objc_setAssociatedObject(self, &AssociatedKeys.YogaKitKey, layout, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//
//        return layout!
//    }
}
