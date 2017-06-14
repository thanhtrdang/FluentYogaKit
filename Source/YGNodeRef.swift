//
//  YGNodeRef.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: - YGNodeRef -
fileprivate let YGNodeMeasureFunc: YGMeasureFunc = { (node: YGNodeRef?, width: Float, widthMode: YGMeasureMode, height: Float, heightMode: YGMeasureMode) -> YGSize in
    let constrainedWidth = (widthMode == .undefined) ? YGValueUndefined.value : width
    let constrainedHeight = (heightMode == .undefined) ? YGValueUndefined.value : height
    let constrainedSize = YGSize(width: constrainedWidth, height: constrainedHeight)
    
    guard let node = node, let view = node.view else {
        return .zero
    }
    
    let sizeThatFits = view.sizeThatFits(constrainedSize.cgSize)
    
    return YGSize(
        width: node.sanitizeMeasurement(constrainedWidth, sizeThatFits.width.value, widthMode),
        height: node.sanitizeMeasurement(constrainedHeight, sizeThatFits.height.value, heightMode)
    )
}

extension YGNodeRef {
    fileprivate static let globalConfig: YGConfigRef? = {
        let config = YGConfigNew()
        YGConfigSetExperimentalFeatureEnabled(config, .webFlexBasis, true)
        YGConfigSetPointScaleFactor(config, Float(scaleFactor))
        
        return config
    }()

    internal init() {
        self = YGNodeNewWithConfig(YGNodeRef.globalConfig)
    }
    
    internal static func dummy() -> YGNodeRef {
        let dummy = YGNodeRef()
        
        YGNodeStyleSetWidth(dummy, 0)
        YGNodeStyleSetHeight(dummy, 0)
        
        return dummy
    }
    
    internal var layoutTop: CGFloat {
        return YGNodeLayoutGetTop(self).cgValue
    }
    internal var layoutLeft: CGFloat {
        return YGNodeLayoutGetLeft(self).cgValue
    }
    internal var layoutWidth: CGFloat {
        return YGNodeLayoutGetWidth(self).cgValue
    }
    internal var layoutHeight: CGFloat {
        return YGNodeLayoutGetHeight(self).cgValue
    }

    internal func getParent() -> YGNodeRef? {
        return YGNodeGetParent(self)
    }
    
    internal func getChild(at index: Int) -> YGNodeRef? {
        return YGNodeGetChild(self, UInt32(index))
    }
    
    internal func insertChild(_ child: YGNodeRef, at index: Int) {
        YGNodeInsertChild(self, child, UInt32(index))
    }

    internal func removeChild(_ child: YGNodeRef) {
        YGNodeRemoveChild(self, child)
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
    
    fileprivate func sanitizeMeasurement(_ constrainedSize: Float, _ measuredSize: Float, _ measureMode: YGMeasureMode) -> Float {
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
    
    internal var isDirty: Bool {
        return YGNodeIsDirty(self)
    }
    
    internal func markDirty() {
        YGNodeMarkDirty(self)
    }
}

// MARK: - Layout association -
fileprivate var YGNodeViewContext = NSMapTable<NSNumber, UIView>.weakToWeakObjects()

extension YGNodeRef {
    internal func attachView(_ view: UIView) {
        YGNodeViewContext.setObject(view, forKey: yogaKey)
    }
    internal func detachView() {
        YGNodeViewContext.removeObject(forKey: yogaKey)
    }

    internal var view: UIView? {
        return YGNodeViewContext.object(forKey: yogaKey)
    }
    
    internal var yogaKey: NSNumber {
       return NSNumber(integerLiteral: hashValue)
    }
}
