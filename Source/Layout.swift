//
//  Layout.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import yoga

import UIKit
import yoga

public class YGLayout {
    internal let node: YGNodeRef
    internal let view: UIView?
    
    fileprivate var superlayout: YGLayout? = nil
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
    
    internal init(view: UIView? = nil) {
        node = YGNodeRef()
        self.view = view
        if view != nil {
            node.attachYoga(self)
        }
    }
    
    deinit {
        if view != nil {
            node.detachYoga()
            view?.detachYoga()
        }
        YGNodeFree(node)
    }
    
    public class func vertical(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().flexDirection(.column).sublayout(sublayouts)
    }
    
    public class func horizontal(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().flexDirection(.row).sublayout(sublayouts)
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
        
        applyLayoutToViews(preserveOrigin: preserveOrigin)
        
        callback?(self)
    }
    
    fileprivate func applyLayoutToViews(preserveOrigin: Bool = false, offset: CGPoint = .zero) {
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
                    $0.applyLayoutToViews(preserveOrigin: preserveOrigin, offset: .zero)
                } else {
                    $0.applyLayoutToViews(preserveOrigin: preserveOrigin, offset: frame.origin)
                }
            }
        }
    }
}

// MARK: - node -
extension YGLayout {
    fileprivate func markNode(detached: Bool) {
        if detached {
            YGNodeRemoveChild(superlayout?.node, node)
        } else {
            if let index = superlayout?.sublayouts.index(where: { $0.node.hashValue == self.node.hashValue }) {
                superlayout?.node.insertChild(child: node, at: index)
            }
        }
    }
    
    fileprivate var isDirty: Bool {
        return YGNodeIsDirty(node)
    }
    
    fileprivate func markDirty() {
        if isDirty || !self.isLeaf {
            return
        }
        
        if node.existMeasureFunc() {
            node.setMeasureFunc()
        }
        
        YGNodeMarkDirty(node)
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
    
    func sizeThatFits(_ size: CGSize) -> CGSize {
        return view?.sizeThatFits(size) ?? .zero
    }
}

//// MARK: - sublayout -
extension YGLayout {
    @discardableResult
    public func vertical(_ sublayouts: Any...) -> Self {
        flexDirection = .column
        return sublayout(sublayouts)
    }
    
    @discardableResult
    public func horizontal(_ sublayouts: Any...) -> Self {
        flexDirection = .row
        return sublayout(sublayouts)
    }
    
    @discardableResult
    fileprivate func sublayout(_ subelements: [Any]) -> Self {
        var marginStart: Float? = nil
        
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
            case is CGFloat:
                if index == 0 {
                    marginStart = Float(any: subelement)
                } else {
                    handleSublayout(marginEnd: Float(any: subelement))
                }
            default:
                print("Don't support \(index) - \(subelement) yet.")
            }
        }
        
        handleSublayout(marginStart: marginStart)
        
        return self
    }
    
    fileprivate func handleSublayout(marginStart: Float?) {
        if let marginStart = marginStart, let firstSublayout = sublayouts.first {
            if flexDirection == .column {
                firstSublayout.marginTop(marginStart)
            } else {
                firstSublayout.marginStart(marginStart)
            }
        }
    }
    
    fileprivate func handleSublayout(marginEnd: Float) {
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
        
        sublayouts.append(sublayout)
    }
}
