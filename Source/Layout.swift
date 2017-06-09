//
//  Layout.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import yoga

public class YGLayout {
    internal let node: YGNodeRef
    fileprivate weak var view: UIView?
    
    fileprivate weak var superlayout: YGLayout? = nil
    fileprivate var sublayouts: [YGLayout] = []
    
    public var isEnabled: Bool = true {
        didSet {
            markNode(detached: !isEnabled)
            markView(hidden: !isEnabled)
            superlayout?.markDirty()
        }
    }
    
    public var isLeaf: Bool {
        return sublayouts.isEmpty
    }
    
    public private(set) var frame: CGRect = .zero {
        didSet {
            view?.frame = frame
        }
    }
    
    public var intrinsicSize: CGSize {
        return calculate(with: YGSize.undefined.cgSize)
    }
    
    internal init(view: UIView? = nil) {
        node = YGNodeRef()
        self.view = view
        if view != nil {
            node.attachView(view!)
        }
    }
    
    deinit {
        node.detachView()
        YGNodeFree(node)
    }
    
    //TODO Expose 2 methods later
    fileprivate func calculate(with size: CGSize) -> CGSize {
        node.calculateLayout(size: size.ygSize, direction: direction)
        return CGSize(width: node.layoutWidth, height: node.layoutHeight)
    }

    fileprivate func applyToViews(preserveOrigin: Bool = false, offset: CGPoint = .zero) {
        if isEnabled {
            let origin = preserveOrigin ? frame.origin : .zero
            let topLeft = CGPoint(x: node.layoutLeft + offset.x, y: node.layoutTop + offset.y)
            let size = CGSize(width: node.layoutWidth, height: node.layoutHeight)
            
            frame = CGRect(
                origin: CGPoint(x: (topLeft.x + origin.x).roundPixel, y: (topLeft.y + origin.y).roundPixel),
                size: size.roundPixel
            )
            
            sublayouts.forEach {
                if isView {
                    $0.applyToViews(preserveOrigin: preserveOrigin, offset: .zero)
                } else {
                    $0.applyToViews(preserveOrigin: preserveOrigin, offset: frame.origin)
                }
            }
        }
    }

    public func apply(preserveOrigin: Bool = false, dimensionFlexibility: YGDimensionFlexibility = [], _ callback: ((YGLayout) -> Void)? = nil) {
        var size = view?.frame.size.ygSize ?? .undefined
        
        if dimensionFlexibility.contains(.flexibleWidth) {
            size.width = YGValueUndefined.value
        }
        if dimensionFlexibility.contains(.flexibleHeigth) {
            size.height = YGValueUndefined.value
        }
        
        node.calculateLayout(size: size, direction: direction)
        
        applyToViews(preserveOrigin: preserveOrigin)
        
        callback?(self)
    }
    
}

// MARK: - node -
extension YGLayout {
    fileprivate func markNode(detached: Bool) {
        if detached {
            superlayout?.node.removeChild(child: node)
        } else {
            if let index = superlayout?.sublayouts.index(where: { $0.node.hashValue == self.node.hashValue }) {
                superlayout?.node.insertChild(child: node, at: index)
            }
        }
    }
    
    fileprivate var isDirty: Bool {
        return node.isDirty
    }
    
    fileprivate func markDirty() {
        if isDirty || !isLeaf {
            return
        }
        
        if node.existMeasureFunc() {
            node.setMeasureFunc()
        }
        
        node.markDirty()
    }
}

// MARK: - view -
extension YGLayout {
    fileprivate var isView: Bool {
        return view != nil
    }
    
    fileprivate func markView(hidden: Bool) {
        view?.isHidden = hidden
        sublayouts.forEach {
            $0.view?.isHidden = hidden
        }
    }
}

// MARK: - sublayout -
extension YGLayout {
    // Shortcuts, easier to read in case of inline uses
    public class func V(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().config(.column, sublayouts)
    }
    public class func H(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().config(.row, sublayouts)
    }
    public func V(_ sublayouts: Any...) -> Self {
        return config(.column, sublayouts)
    }
    public func H(_ sublayouts: Any...) -> Self {
        return config(.row, sublayouts)
    }

    @discardableResult
    public class func vertical(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().config(.column, sublayouts)
    }
    @discardableResult
    public class func horizontal(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().config(.row, sublayouts)
    }
    @discardableResult
    public func vertical(_ sublayouts: Any...) -> Self {
        return config(.column, sublayouts)
    }
    @discardableResult
    public func horizontal(_ sublayouts: Any...) -> Self {
        return config(.row, sublayouts)
    }
    
    // Workaround https://bugs.swift.org/browse/SR-128
    fileprivate func config(_ flexDirection: YGFlexDirection, _ subelements: [Any]) -> Self {
        return self.flexDirection(flexDirection).sublayout(subelements)
    }
    
    @discardableResult
    fileprivate func sublayout(_ subelements: [Any]) -> Self {
        var marginStart: YGValue? = nil
        
        for (index, subelement) in subelements.enumerated() {
            switch subelement {
            case let subview as UIView:
                handleSublayout(subview: subview)
                
            case let sublayout as YGLayout:
                handleSublayout(sublayout: sublayout)
                
            // case _ as String:() //Do nothin'!
            case is Int: fallthrough
            case is Double: fallthrough
            case is Float: fallthrough
            case is CGFloat: fallthrough
            case is YGValue:
                if index == 0 {
                    marginStart = YGValue(any: subelement)
                } else {
                    handleSublayout(marginEnd: YGValue(any: subelement))
                }
            default:
                print("Don't support \(index) - \(subelement) yet.")
            }
        }
        
        handleSublayout(marginStart: marginStart)
        
        stretchIfOnlyOne()
        
        return self
    }
    
    fileprivate func handleSublayout(marginStart: YGValue?) {
        if let marginStart = marginStart, let firstSublayout = sublayouts.first {
            if flexDirection == .column {
                firstSublayout.marginTop(marginStart)
            } else {
                firstSublayout.marginStart(marginStart)
            }
        }
    }
    
    fileprivate func handleSublayout(marginEnd: YGValue) {
        if let lastSublayout = sublayouts.last {
            if flexDirection == .column {
                lastSublayout.marginBottom(marginEnd)
            } else {
                lastSublayout.marginEnd(marginEnd)
            }
        }
    }
    
    fileprivate func handleSublayout(subview: UIView) {        
        handleSublayout(sublayout: subview.yoga)
    }
    
    fileprivate func handleSublayout(sublayout: YGLayout) {
        node.insertChild(child: sublayout.node, at: sublayouts.count)
        if sublayout.isLeaf {
            sublayout.node.setMeasureFunc()
        } else {
            sublayout.node.removeMeasureFunc()
        }
        
        superlayout?.superlayout = self
        sublayouts.append(sublayout)
    }
    
    fileprivate func stretchIfOnlyOne() {
        if sublayouts.count == 1 {
            sublayouts.first?.flexGrow(1)
        }
    }
}
