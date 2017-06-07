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

public struct YGDimensionFlexibility: OptionSet {
    public let rawValue: Int
    
    public static let flexibleWidth = YGDimensionFlexibility(rawValue: 1 << 0)
    public static let flexibleHeigth = YGDimensionFlexibility(rawValue: 1 << 1)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension Float {
    internal init(any value: Any) {
        var m: Float = 0
        if let i = value as? Int {
            m = Float(i)
        } else if let d = value as? Double {
            m = Float(d)
        } else if let cg = value as? CGFloat {
            m = cg.float
        }
        
        self = m
    }
    
    public var cg: CGFloat {
        return cgFloat
    }
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat {
    public var roundPixel: CGFloat {
        return Darwin.round(self * scaleFactor) / scaleFactor
    }
    
    public var f: Float {
        return float
    }
    
    public var float: Float {
        return Float(self)
    }
}

extension CGSize {
    public var ygSize: YGSize {
        return YGSize(width: width.float, height: height.float)
    }
    public var roundPixel: CGSize {
        return CGSize(width: width.roundPixel, height: height.roundPixel)
    }
}

extension YGSize {
    public static let undefined = YGSize(width: YGValueUndefined.value, height: YGValueUndefined.value)
    public static let zero = YGSize(width: 0.0, height: 0.0)
    
    public var cgSize: CGSize {
        return CGSize(width: width.cgFloat, height: height.cgFloat)
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
