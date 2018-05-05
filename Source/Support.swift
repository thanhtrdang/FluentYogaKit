//
//  Support.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

internal let scaleFactor = Float(UIScreen.main.scale)

public struct YGDimensionFlexibility: OptionSet {
  public let rawValue: Int

  static let flexibleWidth = YGDimensionFlexibility(rawValue: 1 << 0)
  static let flexibleHeigth = YGDimensionFlexibility(rawValue: 1 << 1)

  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
}

// MARK: - YGValueType -

public protocol YGValueType {
  static var undefined: Float { get }
  static var cgUndefined: CGFloat { get }

  var value: Float { get }
  var unit: YGUnit { get }

  init(value: Float, unit: YGUnit)
}

public extension YGValueType {
  static var undefined: Float {
    return YGValueUndefined.value
  }

  static var cgUndefined: CGFloat {
    return YGValueUndefined.cgValue
  }

  var roundPixel: CGFloat {
    return roundfPixel.cgValue
  }

  var roundfPixel: Float {
    return Darwin.roundf(value * scaleFactor) / scaleFactor
  }

  var cgValue: CGFloat {
    return CGFloat(value)
  }
}

extension YGValue: YGValueType {}

extension Int: YGValueType {
  public var value: Float {
    return Float(self)
  }

  public var unit: YGUnit {
    return .point
  }

  public init(value: Float = 0, unit _: YGUnit = .point) {
    self = Int(value)
  }
}

extension Float: YGValueType {
  public var value: Float {
    return self
  }

  public var unit: YGUnit {
    return .point
  }

  public init(value: Float = 0, unit _: YGUnit = .point) {
    self = value
  }
}

extension CGFloat: YGValueType {
  public var value: Float {
    return Float(self)
  }

  public var unit: YGUnit {
    return .point
  }

  public init(value: Float = 0, unit _: YGUnit = .point) {
    self = value.cgValue
  }
}

// MARK: - Percentage -

postfix operator %

public extension Int {
  static postfix func % (value: Int) -> YGValueType {
    return YGValue(value: Float(value), unit: .percent)
  }
}

public extension Float {
  static postfix func % (value: Float) -> YGValueType {
    return YGValue(value: value, unit: .percent)
  }
}

public extension CGFloat {
  static postfix func % (value: CGFloat) -> YGValueType {
    return YGValue(value: Float(value), unit: .percent)
  }
}

public extension YGValue {
  static postfix func % (value: YGValue) -> YGValueType {
    return YGValue(value: value.value, unit: .percent)
  }
}

public extension CGSize {
  static let undefined = CGSize(width: YGValueUndefined.cgValue, height: YGValueUndefined.cgValue)

  var roundPixel: CGSize {
    return CGSize(width: width.roundPixel, height: height.roundPixel)
  }

  var ygSize: YGSize {
    return YGSize(width: width.value, height: height.value)
  }
}

public extension YGSize {
  static let undefined = YGSize(width: YGValueUndefined.value, height: YGValueUndefined.value)
  static let zero = YGSize(width: 0.0, height: 0.0)

  var roundPixel: YGSize {
    return YGSize(width: width.roundfPixel, height: height.roundfPixel)
  }

  var cgSize: CGSize {
    return CGSize(width: width.cgValue, height: height.cgValue)
  }
}
