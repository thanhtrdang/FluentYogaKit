//
//  Layout.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import yoga

// MARK: - YGLayoutElement -
public class YGLayoutElement {
    internal var node: YGNodeRef!
    internal var subelements: [YGLayoutElement] = []
    internal var isIncluded: Bool = true
    internal var isEnabled: Bool = false
    internal var frame: CGRect = .zero
    public var isLeaf: Bool { return false }
    public var isView: Bool { return false }
    
    init() {
        node = YGNodeRef(element: self)
    }
    
    deinit {
        node.removeElement()
        YGNodeFree(node)
    }

    public func layout(preserveOrigin: Bool = false, dimensionFlexibility: YGDimensionFlexibility = []) {
        var size = frame.size
        
        if dimensionFlexibility.contains(.flexibleWidth) {
            size.width = CGFloat(YGValueUndefined.value)
        }
        if dimensionFlexibility.contains(.flexibleHeigth) {
            size.height = CGFloat(YGValueUndefined.value)
        }
        
        calculateLayout(size: size.ygSize)
        
        applyLayout(preserveOrigin: preserveOrigin, offset: .zero)
    }
    
    internal func calculateLayout(size: YGSize) {
        assert(Thread.isMainThread, "Yoga calculation must be done on main.")
        assert(isEnabled, "Yoga is not enabled for this layout element.")
        
        attachNodes()
        YGNodeCalculateLayout(node, size.width, size.height, YGNodeStyleGetDirection(node))
//        return YGSize(width: YGNodeLayoutGetWidth(node), height: YGNodeLayoutGetHeight(node))
    }
    
    internal func attachNodes() {
        if isLeaf {
            node.removeChildren()
            node.setMeasureFunc()
        } else {
            node.removeMeasureFunc()
            let includedSubelements = subelements.filter {
                $0.isIncluded
            }
            
            if !node.hasExactSameChildren(subelements: includedSubelements) {
                node.removeChildren()
                node.insertChildren(subelements: includedSubelements)
            }
            
            includedSubelements.forEach {
                $0.attachNodes()
            }
        }
    }
    
    internal func applyLayout(preserveOrigin: Bool, offset: CGPoint) {
        assert(Thread.isMainThread, "Framesetting should only be done on the main thread.")
        
        let topLeft = CGPoint(x: CGFloat(YGNodeLayoutGetLeft(node)) + offset.x, y: CGFloat(YGNodeLayoutGetTop(node)) + offset.y)
        let nodeSize = CGSize(width: CGFloat(YGNodeLayoutGetWidth(node)), height: CGFloat(YGNodeLayoutGetHeight(node)))
        let origin = preserveOrigin ? frame.origin : .zero
        
        frame = CGRect(
            origin: CGPoint(x: (topLeft.x + origin.x).roundPixel, y: (topLeft.y + origin.y).roundPixel),
            size: nodeSize.roundPixel
        )
        
        if !isLeaf {
            subelements.forEach {
                if isView {
                    $0.applyLayout(preserveOrigin: preserveOrigin, offset: .zero)
                } else {
                    $0.applyLayout(preserveOrigin: preserveOrigin, offset: frame.origin)
                }
            }
        }
    }
 
    internal func sizeThatFits(_ size: CGSize) -> CGSize {
        return .zero
    }
}

public class YGLayoutView: YGLayoutElement {
    internal let view: UIView
    override internal var frame: CGRect {
        get {
            return view.frame
        }
        set {
            view.frame = newValue
        }
    }
    override public var isLeaf: Bool {
        return !isEnabled || (nil == subelements.first { $0.isEnabled && $0.isIncluded })
    }
    override public var isView: Bool {
        return true
    }

    public init(view: UIView) {
        self.view = view
    }
    
    override internal func sizeThatFits(_ size: CGSize) -> CGSize {
        return view.sizeThatFits(size)
    }
}
