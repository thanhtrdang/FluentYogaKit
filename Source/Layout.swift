//
//  Layout.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import yoga

/*
 inset, stack, center, relative, overlay, background, absolute, ratio
 */

// MARK: - YGLayoutElement -
public class YGLayoutElement {
    internal var node: YGNodeRef!
    internal var subelements: [YGLayoutElement] = []
    internal var containerStyle: YGLayoutContainerStyle?
    internal var isIncluded: Bool = true
    internal var isEnabled: Bool = true
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
    
    public subscript(i: Int) -> YGLayoutElement? {
        var result: YGLayoutElement? = nil
        if 0 <= i && i < subelements.count {
            result = subelements[i]
        }
        return result
    }

    public subscript(i: Int, j: Int) -> YGLayoutElement? {
        var result: YGLayoutElement? = nil
        if 0 <= i && i < subelements.count {
            let iSubelement = subelements[i]
            if 0 <= j && j < iSubelement.subelements.count {
                result = iSubelement[j]
            }
        }
        return result
    }
    
    internal func attachNodes() {
        if isLeaf {
            node.setMeasureFunc()
        } else {
            node.removeMeasureFunc()
            let includedSubelements = subelements.filter {
                $0.isIncluded
            }
            includedSubelements.forEach {
                $0.attachNodes()
            }
        }
//        if isLeaf {
//            node.removeChildren()
//            node.setMeasureFunc()
//        } else {
//            node.removeMeasureFunc()
//            
//            let includedSubelements = subelements.filter {
//                $0.isIncluded
//            }
//            
//            if !node.hasExactSameChildren(subelements: includedSubelements) {
//                node.removeChildren()
//                node.insertChildren(subelements: includedSubelements)
//            }
//            
//            includedSubelements.forEach {
//                $0.attachNodes()
//            }
//        }
    }
    
    internal func applyLayout(preserveOrigin: Bool, offset: CGPoint) {
        assert(Thread.isMainThread, "Framesetting should only be done on the main thread.")
        
        let topLeft = CGPoint(x: node.layoutLeft + offset.x, y: node.layoutTop + offset.y)
        let nodeSize = CGSize(width: node.layoutWidth, height: node.layoutHeight)
        let origin = preserveOrigin ? frame.origin : .zero
        
        frame = CGRect(
            origin: CGPoint(x: (topLeft.x + origin.x).roundPixel, y: (topLeft.y + origin.y).roundPixel),
            size: nodeSize.roundPixel
        )
        
        print("leaf-\(isLeaf) - frame-\(frame)")
        
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
    
    @discardableResult
    public func layout(preserveOrigin: Bool = false, dimensionFlexibility: YGDimensionFlexibility = [], _ callback: ((YGLayoutView) -> Void)? = nil) -> Self {
        var size = frame.size
        
        if dimensionFlexibility.contains(.flexibleWidth) {
            size.width = YGValueUndefined.value.cgFloat
        }
        if dimensionFlexibility.contains(.flexibleHeigth) {
            size.height = YGValueUndefined.value.cgFloat
        }
        
        calculateLayout(size: size.ygSize)
        
        applyLayout(preserveOrigin: preserveOrigin, offset: .zero)
        
        callback?(self)
        
        return self
    }
    
    internal func calculateLayout(size: YGSize) {
        assert(Thread.isMainThread, "Yoga calculation must be done on main.")
        assert(isEnabled, "Yoga is not enabled for this layout element.")
        
        attachNodes()
        node.calculateLayout(size: size, direction: direction)
    }

}
