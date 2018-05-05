//
//  Style.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/30/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: - Style -

extension YGLayout {
  public var direction: YGDirection {
    get {
      return YGNodeStyleGetDirection(node)
    }
    set {
      YGNodeStyleSetDirection(node, newValue)
    }
  }

  public var flexDirection: YGFlexDirection {
    get {
      return YGNodeStyleGetFlexDirection(node)
    }
    set {
      YGNodeStyleSetFlexDirection(node, newValue)
    }
  }

  public var justifyContent: YGJustify {
    get {
      return YGNodeStyleGetJustifyContent(node)
    }
    set {
      YGNodeStyleSetJustifyContent(node, newValue)
    }
  }

  public var alignContent: YGAlign {
    get {
      return YGNodeStyleGetAlignContent(node)
    }
    set {
      YGNodeStyleSetAlignContent(node, newValue)
    }
  }

  public var alignItems: YGAlign {
    get {
      return YGNodeStyleGetAlignItems(node)
    }
    set {
      YGNodeStyleSetAlignItems(node, newValue)
    }
  }

  public var alignSelf: YGAlign {
    get {
      return YGNodeStyleGetAlignSelf(node)
    }
    set {
      YGNodeStyleSetAlignSelf(node, newValue)
    }
  }

  public var position: YGPositionType {
    get {
      return YGNodeStyleGetPositionType(node)
    }
    set {
      YGNodeStyleSetPositionType(node, newValue)
    }
  }

  public var flexWrap: YGWrap {
    get {
      return YGNodeStyleGetFlexWrap(node)
    }
    set {
      YGNodeStyleSetFlexWrap(node, newValue)
    }
  }

  public var overflow: YGOverflow {
    get {
      return YGNodeStyleGetOverflow(node)
    }
    set {
      YGNodeStyleSetOverflow(node, newValue)
    }
  }

  public var display: YGDisplay {
    get {
      return YGNodeStyleGetDisplay(node)
    }
    set {
      YGNodeStyleSetDisplay(node, newValue)
    }
  }

  public var flexGrow: Float {
    get {
      return YGNodeStyleGetFlexGrow(node)
    }
    set {
      YGNodeStyleSetFlexGrow(node, newValue)
    }
  }

  public var flexShrink: Float {
    get {
      return YGNodeStyleGetFlexShrink(node)
    }
    set {
      YGNodeStyleSetFlexShrink(node, newValue)
    }
  }

  public var flexBasis: YGValueType {
    get {
      return YGNodeStyleGetFlexBasis(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetFlexBasisPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetFlexBasis(node, newValue.value)
      }
    }
  }

  public var left: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .left)
    }
    set {
      _setPosition(.left, newValue)
    }
  }

  public var top: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .top)
    }
    set {
      _setPosition(.top, newValue)
    }
  }

  public var right: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .right)
    }
    set {
      _setPosition(.right, newValue)
    }
  }

  public var bottom: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .bottom)
    }
    set {
      _setPosition(.bottom, newValue)
    }
  }

  public var start: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .start)
    }
    set {
      _setPosition(.start, newValue)
    }
  }

  public var end: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .end)
    }
    set {
      _setPosition(.end, newValue)
    }
  }

  public var marginLeft: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .left)
    }
    set {
      _setMargin(.left, newValue)
    }
  }

  public var marginTop: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .top)
    }
    set {
      _setMargin(.top, newValue)
    }
  }

  public var marginRight: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .right)
    }
    set {
      _setMargin(.right, newValue)
    }
  }

  public var marginBottom: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .bottom)
    }
    set {
      _setMargin(.bottom, newValue)
    }
  }

  public var marginStart: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .start)
    }
    set {
      _setMargin(.start, newValue)
    }
  }

  public var marginEnd: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .end)
    }
    set {
      _setMargin(.end, newValue)
    }
  }

  public var marginHorizontal: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .horizontal)
    }
    set {
      _setMargin(.horizontal, newValue)
    }
  }

  public var marginVertical: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .vertical)
    }
    set {
      _setMargin(.vertical, newValue)
    }
  }

  public var margin: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .all)
    }
    set {
      _setMargin(.all, newValue)
    }
  }

  public var paddingLeft: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .left)
    }
    set {
      _setPadding(.left, newValue)
    }
  }

  public var paddingTop: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .top)
    }
    set {
      _setPadding(.top, newValue)
    }
  }

  public var paddingRight: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .right)
    }
    set {
      _setPadding(.right, newValue)
    }
  }

  public var paddingBottom: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .bottom)
    }
    set {
      _setPadding(.bottom, newValue)
    }
  }

  public var paddingStart: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .start)
    }
    set {
      _setPadding(.start, newValue)
    }
  }

  public var paddingEnd: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .end)
    }
    set {
      _setPadding(.end, newValue)
    }
  }

  public var paddingHorizontal: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .horizontal)
    }
    set {
      _setPadding(.horizontal, newValue)
    }
  }

  public var paddingVertical: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .vertical)
    }
    set {
      _setPadding(.vertical, newValue)
    }
  }

  public var padding: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .all)
    }
    set {
      _setPadding(.all, newValue)
    }
  }

  public var borderLeft: Float {
    get {
      return YGNodeStyleGetBorder(node, .left)
    }
    set {
      YGNodeStyleSetBorder(node, .left, newValue)
    }
  }

  public var borderTop: Float {
    get {
      return YGNodeStyleGetBorder(node, .top)
    }
    set {
      YGNodeStyleSetBorder(node, .top, newValue)
    }
  }

  public var borderRight: Float {
    get {
      return YGNodeStyleGetBorder(node, .right)
    }
    set {
      YGNodeStyleSetBorder(node, .right, newValue)
    }
  }

  public var borderBottom: Float {
    get {
      return YGNodeStyleGetBorder(node, .bottom)
    }
    set {
      YGNodeStyleSetBorder(node, .bottom, newValue)
    }
  }

  public var borderStart: Float {
    get {
      return YGNodeStyleGetBorder(node, .start)
    }
    set {
      YGNodeStyleSetBorder(node, .start, newValue)
    }
  }

  public var borderEnd: Float {
    get {
      return YGNodeStyleGetBorder(node, .end)
    }
    set {
      YGNodeStyleSetBorder(node, .end, newValue)
    }
  }

  public var borderVertical: Float {
    get {
      return YGNodeStyleGetBorder(node, .vertical)
    }
    set {
      YGNodeStyleSetBorder(node, .vertical, newValue)
    }
  }

  public var borderHorizontal: Float {
    get {
      return YGNodeStyleGetBorder(node, .horizontal)
    }
    set {
      YGNodeStyleSetBorder(node, .horizontal, newValue)
    }
  }

  public var border: Float {
    get {
      return YGNodeStyleGetBorder(node, .all)
    }
    set {
      YGNodeStyleSetBorder(node, .all, newValue)
    }
  }

  public var width: YGValueType {
    get {
      return YGNodeStyleGetWidth(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetWidthPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetWidth(node, newValue.value)
      }
    }
  }

  public var height: YGValueType {
    get {
      return YGNodeStyleGetHeight(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetHeightPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetHeight(node, newValue.value)
      }
    }
  }

  public var minWidth: YGValueType {
    get {
      return YGNodeStyleGetMinWidth(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetMinWidthPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetMinWidth(node, newValue.value)
      }
    }
  }

  public var minHeight: YGValueType {
    get {
      return YGNodeStyleGetMinHeight(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetMinHeightPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetMinHeight(node, newValue.value)
      }
    }
  }

  public var maxWidth: YGValueType {
    get {
      return YGNodeStyleGetMaxWidth(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetMaxWidthPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetMaxWidth(node, newValue.value)
      }
    }
  }

  public var maxHeight: YGValueType {
    get {
      return YGNodeStyleGetMaxHeight(node)
    }
    set {
      switch newValue.unit {
      case .percent:
        YGNodeStyleSetMaxHeightPercent(node, newValue.value)
      case .point: fallthrough
      default:
        YGNodeStyleSetMaxHeight(node, newValue.value)
      }
    }
  }

  // Yoga specific properties, not compatible with flexbox specification
  public var aspectRatio: Float {
    get {
      return YGNodeStyleGetAspectRatio(node)
    }
    set {
      YGNodeStyleSetAspectRatio(node, newValue)
    }
  }

  /**
   Get the resolved direction of this node. This won't be YGDirectionInherit
   */
  public var resolvedDirection: YGDirection {
    return YGNodeLayoutGetDirection(node)
  }
}

internal extension YGLayout {
  func _setPosition(_ edge: YGEdge, _ value: YGValueType) {
    switch value.unit {
    case .percent:
      YGNodeStyleSetPositionPercent(node, edge, value.value)
    case .point: fallthrough
    default:
      YGNodeStyleSetPosition(node, edge, value.value)
    }
  }

  func _setMargin(_ edge: YGEdge, _ value: YGValueType) {
    switch value.unit {
    case .percent:
      YGNodeStyleSetMarginPercent(node, edge, value.value)
    case .point: fallthrough
    default:
      YGNodeStyleSetMargin(node, edge, value.value)
    }
  }

  func _setPadding(_ edge: YGEdge, _ value: YGValueType) {
    switch value.unit {
    case .percent:
      YGNodeStyleSetPaddingPercent(node, edge, value.value)
    case .point: fallthrough
    default:
      YGNodeStyleSetPadding(node, edge, value.value)
    }
  }
}
