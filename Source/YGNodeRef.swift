//
//  YGNodeRef.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: - YGNodeRef -
fileprivate var YGNodeLayoutContext: [YGNodeRef: YGLayoutElement] = [:]

fileprivate let YGNodeMeasureFunc: YGMeasureFunc = { (node: YGNodeRef?, width: Float, widthMode: YGMeasureMode, height: Float, heightMode: YGMeasureMode) -> YGSize in
    let constrainedWidth = (widthMode == .undefined) ? YGValueUndefined.value : width
    let constrainedHeight = (heightMode == .undefined) ? YGValueUndefined.value : height
    let constrainedSize = YGSize(width: constrainedWidth, height: constrainedHeight)
    
    let element = node!.element
    let sizeThatFits = element.sizeThatFits(constrainedSize.cgSize)
    
    let ygSize = YGSize(
        width: node!.sanitizeMeasurement(constrainedSize: constrainedWidth, measuredSize: Float(sizeThatFits.width), measureMode: widthMode),
        height: node!.sanitizeMeasurement(constrainedSize: constrainedHeight, measuredSize: Float(sizeThatFits.height), measureMode: heightMode)
    )
    
//TODO remove this debug later
//    let v = (element as! YGLayoutView).view
//    
////    if v is UILabel {
////        let l = v as! UILabel
////        print("\(l.text) - \(ygSize)")
////    }
//    
//    print("YGMeasureFunc - \(ygSize) - \(v.className)")
    
    return ygSize
}

extension YGNodeRef {
    fileprivate static let globalConfig: YGConfigRef? = {
        let config = YGConfigNew()
        YGConfigSetExperimentalFeatureEnabled(config, .webFlexBasis, true)
        YGConfigSetPointScaleFactor(config, Float(scaleFactor))
        
        return config
    }()
    
    internal init(element: YGLayoutElement) {
        self = YGNodeNewWithConfig(YGNodeRef.globalConfig)
        self.element = element
    }

    internal var layoutTop: CGFloat {
        return YGNodeLayoutGetTop(self).cgFloat
    }
    internal var layoutLeft: CGFloat {
        return YGNodeLayoutGetLeft(self).cgFloat
    }
    internal var layoutWidth: CGFloat {
        return YGNodeLayoutGetWidth(self).cgFloat
    }
    internal var layoutHeight: CGFloat {
        return YGNodeLayoutGetHeight(self).cgFloat
    }
    
    internal var element: YGLayoutElement {
        get {
            //TODO YGNodeGetContext(self).load(as: XLayoutElement.self)
            return YGNodeLayoutContext[self]!
        }
        set {
            //TODO YGNodeSetContext(self, &element)
            YGNodeLayoutContext[self] = newValue
        }
    }
    
    internal func removeElement() {
        YGNodeLayoutContext.removeValue(forKey: self)
    }
    
    internal func insertChild(child: YGNodeRef, at index: Int) {
        YGNodeInsertChild(self, child, UInt32(index))
    }
    
    internal func insertChildren(subelements: [YGLayoutElement]) {
        for (index, subelement) in subelements.enumerated() {
            insertChild(child: subelement.node, at: index)
        }
    }
    
    internal func getChild(at index: Int) -> YGNodeRef {
        return YGNodeGetChild(self, UInt32(index))
    }
    
    internal func childCount() -> Int {
        return Int(YGNodeGetChildCount(self))
    }
    
    internal func removeChildren() {
        var childCount = YGNodeGetChildCount(self)
        while childCount > 0 {
            YGNodeRemoveChild(self, YGNodeGetChild(self, childCount - 1))
            childCount = YGNodeGetChildCount(self)
        }
    }
    
    internal func hasExactSameChildren(subelements: [YGLayoutElement]) -> Bool {
        var result = true
        
        if childCount() != subelements.count {
            result = false
        } else {
            for (index, subelement) in subelements.enumerated() {
                if getChild(at: index) != subelement.node {
                    result = false
                    break
                }
            }
        }
        
        return result
    }
    
    internal func existMeasureFunc() -> Bool {
        return YGNodeGetMeasureFunc(self) != nil
    }
    
    internal func setMeasureFunc() {
        YGNodeSetMeasureFunc(self, YGNodeMeasureFunc)
    }
    
    internal func removeMeasureFunc() {
        YGNodeSetMeasureFunc(self, nil)
    }
    
    fileprivate func sanitizeMeasurement(constrainedSize: Float, measuredSize: Float, measureMode: YGMeasureMode) -> Float {
        var result: Float
        
        switch measureMode {
        case .exactly:
            result = constrainedSize
        case .atMost:
            result = min(constrainedSize, measuredSize)
        default:
            result = measuredSize
        }
        
        return result
    }
    
    internal func calculateLayout(size: YGSize, direction: YGDirection) {
        YGNodeCalculateLayout(self, size.width, size.height, direction)
    }
}
