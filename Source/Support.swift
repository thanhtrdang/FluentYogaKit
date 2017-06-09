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

// MARK: - Convertable - 
extension Float {
    public var roundPixel: Float {
        return Darwin.round(self * scaleFactor.f) / scaleFactor.f
    }

    public var cg: CGFloat {
        return cgFloat
    }
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    public var yg: YGValue {
        return ygValue
    }
    public var ygValue: YGValue {
        return YGValue(self)
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
    public var yg: YGValue {
        return ygValue
    }
    public var ygValue: YGValue {
        return YGValue(self)
    }
}

// Support type = .point only
extension YGValue {
    public var roundPixel: YGValue {
        if unit == .point {
            return YGValue(Darwin.round(self.cg * scaleFactor) / scaleFactor)
        } else {
            return self
        }
    }
    
    public var f: Float {
        return float
    }
    public var float: Float {
        return value
    }
    public var cg: CGFloat {
        return cgFloat
    }
    public var cgFloat: CGFloat {
        return value.cg
    }
}

extension CGSize {
    public var roundPixel: CGSize {
        return CGSize(width: width.roundPixel, height: height.roundPixel)
    }
    public var yg: YGSize {
        return ygSize
    }
    public var ygSize: YGSize {
        return YGSize(width: width.float, height: height.float)
    }
}

// Support type = .point only
extension YGSize {
    public static let undefined = YGSize(width: YGValueUndefined.value, height: YGValueUndefined.value)
    public static let zero = YGSize(width: 0.0, height: 0.0)

    public var roundPixel: YGSize {
        return YGSize(width: width.roundPixel, height: height.roundPixel)
    }
    
    public var ygWidth: YGValue {
        return YGValue(floatLiteral: width)
    }
    public var ygHeight: YGValue {
        return YGValue(floatLiteral: height)
    }
    
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

extension YGValue: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
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

    public init(_ value: Double) {
        self = YGValue(value: Float(value), unit: .point)
    }

    internal init(any value: Any) {
        if value is YGValue {
            self = value as! YGValue
        } else {
            var m: YGValue = 0
            if let i = value as? Int {
                m = YGValue(integerLiteral: i)
            } else if let d = value as? Double {
                m = YGValue(d)
            } else if let d = value as? Float {
                m = YGValue(d)
            } else if let cg = value as? CGFloat {
                m = YGValue(cg)
            }
            
            self = m
        }
    }
}
