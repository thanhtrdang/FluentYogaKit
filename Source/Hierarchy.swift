//
//  Hierarchy.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/31/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
     convenience init() {
     self.init(frame: CGRect.zero)
     
     sv(
     email,
     password,
     login
     )
     ...
     
     }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public func sv(_ subviews: UIView...) -> UIView {
        return sv(subviews)
    }
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
     convenience init() {
     self.init(frame: CGRect.zero)
     
     sv(
     email,
     password,
     login
     )
     ...
     
     }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public func sv(_ subviews: [UIView]) -> UIView {
        subviews.forEach {
            addSubview($0)
        }
        return self
    }
}

public extension UITableViewCell {
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class NotificationCell: UITableViewCell {
     
     var avatar = UIImageView()
     var name = UILabel()
     var followButton = UIButton()
     
     required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
     override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier) {
     
     sv(
     avatar,
     name,
     followButton
     )
     ...
     
     }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public override func sv(_ subviews: [UIView]) -> UIView {
        return contentView.sv(subviews)
    }
}

public extension UICollectionViewCell {
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class PhotoCollectionViewCell: UICollectionViewCell {
     
     var avatar = UIImageView()
     var name = UILabel()
     var followButton = UIButton()
     
     
     required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
     override init(frame: CGRect) {
     super.init(frame: frame)
     
     sv(
     avatar,
     name,
     followButton
     )
     ...
     
     }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public override func sv(_ subviews: [UIView]) -> UIView {
        return contentView.sv(subviews)
    }
}
