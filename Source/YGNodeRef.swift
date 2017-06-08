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
    
    guard let node = node, let layout = node.yoga else {
        return .zero
    }
    
    let sizeThatFits = layout.sizeThatFits(constrainedSize.cgSize)
    
    return YGSize(
        width: node.sanitizeMeasurement(constrainedWidth, sizeThatFits.width.float, widthMode),
        height: node.sanitizeMeasurement(constrainedHeight, sizeThatFits.height.float, heightMode)
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
    
    internal func insertChild(child: YGNodeRef, at index: Int) {
        YGNodeInsertChild(self, child, UInt32(index))
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
fileprivate var YGNodeLayoutContext = NSMapTable<NSNumber, YGLayout>.strongToWeakObjects()

extension YGNodeRef {
    internal func attachYoga(_ layout: YGLayout) {
        YGNodeLayoutContext.setObject(layout, forKey: yogaKey)
    }
    internal var yoga: YGLayout? {
        return YGNodeLayoutContext.object(forKey: yogaKey)
    }
    
    internal var yogaKey: NSNumber {
       return NSNumber(integerLiteral: hashValue)
    }
}
