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
    internal var dummy: YGNodeRef?
    internal weak var view: UIView?
    
    internal weak var superlayout: YGLayout? = nil
    internal var sublayouts: [YGLayout] = []
    
    public internal(set) var isEnabled: Bool = true
    
    internal var isRecursiveEnabled: Bool {
        @available(*, unavailable)
        get {
            fatalError("Swift limit: setter must has getter. So use isEnabled instead of.")
        }
        set {
            isEnabled = newValue
            view?.isHidden = !newValue
            sublayouts.forEach { $0.isRecursiveEnabled = newValue }
        }
    }
    
    public var isLeaf: Bool {
        return sublayouts.isEmpty
    }
    
    public var isRoot: Bool {
        return superlayout == nil
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
        if dummy != nil {
            YGNodeFree(dummy)
        }

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
    fileprivate func index(of sublayout: YGLayout) -> Int? {
        return sublayouts.index(where: { $0.node == sublayout.node })
    }
    
    internal func markNode(dummy: Bool) {
        if dummy {
            node2Dummy()
        }
        else {
            let parent = node.getParent()
            if parent != superlayout?.node {
                parent?.removeChild(node)
                dummy2Node()
            }
        }
    }
    
    fileprivate func node2Dummy() {
        if let index = superlayout?.index(of: self) {
            superlayout?.node.removeChild(node)
            dummy = dummy ?? YGNodeRef.dummy()
            superlayout?.node.insertChild(dummy!, at: index)
        }
    }
    
    fileprivate func dummy2Node() {
        if let dummy = dummy {
            superlayout?.node.removeChild(dummy)
        }
        if let index = superlayout?.index(of: self) {
            superlayout?.node.insertChild(node, at: index)
        }
    }
    
    public var isDirty: Bool {
        return node.isDirty
    }
    
    public func markDirty() {
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
    public var isView: Bool {
        return view != nil
    }
    
    internal func markView(hidden: Bool) {
        view?.isHidden = hidden
        sublayouts.forEach {
            $0.view?.isHidden = hidden
        }
    }
}

// MARK: - sublayout -
extension YGLayout {
    public class func vertical(_ sublayouts: Any...) -> YGLayout {
        return YGLayout().config(.column, sublayouts)
    }
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
    internal func config(_ flexDirection: YGFlexDirection, _ subelements: [Any]) -> Self {
        return self.flexDirection(flexDirection).sublayout(subelements)
    }
    
    internal func sublayout(_ subelements: [Any]) -> Self {
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
    
    internal func handleSublayout(subview: UIView, atFirst: Bool = false) {
        handleSublayout(sublayout: subview.yoga)
    }
    
    internal func handleSublayout(sublayout: YGLayout, atFirst: Bool = false) {
        let index = atFirst ? 0 : sublayouts.count
        insertSublayout(sublayout, at: index)
    }
    
}

// MARK: - Sublayout - Collection -
extension YGLayout {
    public subscript(index: Int) -> YGLayout {
        get {
            return sublayouts[index]
        }
        set {
            let oldValue = sublayouts[index]
            if oldValue.node != newValue.node {
                removeSublayout(at: index)
                insertSublayout(newValue, at: index)
            }
        }
    }
    
    @discardableResult
    public func removeSublayout(at index: Int) -> YGLayout? {
        if 0 <= index && index < sublayouts.count {
            let sublayout = sublayouts[index]
            
            if let subdummy = sublayout.dummy {
                node.removeChild(subdummy)
            }
            node.removeChild(sublayout.node)
            
            sublayout.superlayout = nil
            sublayouts.remove(at: index)
            
            return sublayout
        } else {
            return nil
        }
    }
    
    public func insertSublayout(_ subview: UIView, at index: Int) {
        insertSublayout(YGLayout(view: subview), at: index)
    }
    
    public func insertSublayout(_ sublayout: YGLayout, at index: Int) {
        if 0 <= index && index <= sublayouts.count {
            if sublayout.isEnabled {
                node.insertChild(sublayout.node, at: index)
            }
            if sublayout.isLeaf {
                sublayout.node.setMeasureFunc()
            } else {
                sublayout.node.removeMeasureFunc()
            }
            
            sublayout.superlayout = self
            sublayouts.insert(sublayout, at: index)
        }
    }
}
