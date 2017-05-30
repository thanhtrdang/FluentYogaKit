//
//  Support.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import yoga

internal let scaleFactor = UIScreen.main.scale

public struct YGDimensionFlexibility : OptionSet {
    public let rawValue: Int
    
    public static let flexibleWidth = YGDimensionFlexibility(rawValue: 1 << 0)
    public static let flexibleHeigth = YGDimensionFlexibility(rawValue: 1 << 1)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

/*
 inset, stack, center, relative, overlay, background, absolute, ratio
 */

extension CGFloat {
    internal var roundPixel: CGFloat {        
        return Darwin.round(self * scaleFactor) / scaleFactor
    }
    
    internal var float: Float {
        return Float(self)
    }
}

extension CGSize {
    internal var ygSize: YGSize {
        return YGSize(width: Float(width), height: Float(height))
    }
    internal var roundPixel: CGSize {
        return CGSize(width: width.roundPixel, height: height.roundPixel)
    }
}

extension YGSize {
    internal static let undefined = YGSize(width: YGValueUndefined.value, height: YGValueUndefined.value)
    
    internal var cgSize: CGSize {
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}

// MARK: - Percentage -
postfix operator %

extension Int {
    public static postfix func %(value: Int) -> YGValue {
        return YGValue(value: Float(value), unit: .percent)
    }
}

extension Float {
    public static postfix func %(value: Float) -> YGValue {
        return YGValue(value: value, unit: .percent)
    }
}

extension CGFloat {
    public static postfix func %(value: CGFloat) -> YGValue {
        return YGValue(value: Float(value), unit: .percent)
    }
}

extension YGValue : ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public init(integerLiteral value: Int) {
        self = YGValue(value: Float(value), unit: .point)
    }
    
    public init(floatLiteral value: Float) {
        self = YGValue(value: value, unit: .point)
    }
    
    public init(_ value: Float) {
        self = YGValue(value: value, unit: .point)
    }
    
    public init(_ value: CGFloat) {
        self = YGValue(value: Float(value), unit: .point)
    }
}
