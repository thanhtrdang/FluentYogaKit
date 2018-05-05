//
//  Style.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/30/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: - Style -

public extension YGLayout {
  var direction: YGDirection {
    get {
      return YGNodeStyleGetDirection(node)
    }
    set {
      YGNodeStyleSetDirection(node, newValue)
    }
  }

  var flexDirection: YGFlexDirection {
    get {
      return YGNodeStyleGetFlexDirection(node)
    }
    set {
      YGNodeStyleSetFlexDirection(node, newValue)
    }
  }

  var justifyContent: YGJustify {
    get {
      return YGNodeStyleGetJustifyContent(node)
    }
    set {
      YGNodeStyleSetJustifyContent(node, newValue)
    }
  }

  var alignContent: YGAlign {
    get {
      return YGNodeStyleGetAlignContent(node)
    }
    set {
      YGNodeStyleSetAlignContent(node, newValue)
    }
  }

  var alignItems: YGAlign {
    get {
      return YGNodeStyleGetAlignItems(node)
    }
    set {
      YGNodeStyleSetAlignItems(node, newValue)
    }
  }

  var alignSelf: YGAlign {
    get {
      return YGNodeStyleGetAlignSelf(node)
    }
    set {
      YGNodeStyleSetAlignSelf(node, newValue)
    }
  }

  var position: YGPositionType {
    get {
      return YGNodeStyleGetPositionType(node)
    }
    set {
      YGNodeStyleSetPositionType(node, newValue)
    }
  }

  var flexWrap: YGWrap {
    get {
      return YGNodeStyleGetFlexWrap(node)
    }
    set {
      YGNodeStyleSetFlexWrap(node, newValue)
    }
  }

  var overflow: YGOverflow {
    get {
      return YGNodeStyleGetOverflow(node)
    }
    set {
      YGNodeStyleSetOverflow(node, newValue)
    }
  }

  var display: YGDisplay {
    get {
      return YGNodeStyleGetDisplay(node)
    }
    set {
      YGNodeStyleSetDisplay(node, newValue)
    }
  }

  var flexGrow: Float {
    get {
      return YGNodeStyleGetFlexGrow(node)
    }
    set {
      YGNodeStyleSetFlexGrow(node, newValue)
    }
  }

  var flexShrink: Float {
    get {
      return YGNodeStyleGetFlexShrink(node)
    }
    set {
      YGNodeStyleSetFlexShrink(node, newValue)
    }
  }

  var flexBasis: YGValueType {
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

  var left: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .left)
    }
    set {
      setPosition(.left, newValue)
    }
  }

  var top: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .top)
    }
    set {
      setPosition(.top, newValue)
    }
  }

  var right: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .right)
    }
    set {
      setPosition(.right, newValue)
    }
  }

  var bottom: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .bottom)
    }
    set {
      setPosition(.bottom, newValue)
    }
  }

  var start: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .start)
    }
    set {
      setPosition(.start, newValue)
    }
  }

  var end: YGValueType {
    get {
      return YGNodeStyleGetPosition(node, .end)
    }
    set {
      setPosition(.end, newValue)
    }
  }

  var marginLeft: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .left)
    }
    set {
      setMargin(.left, newValue)
    }
  }

  var marginTop: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .top)
    }
    set {
      setMargin(.top, newValue)
    }
  }

  var marginRight: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .right)
    }
    set {
      setMargin(.right, newValue)
    }
  }

  var marginBottom: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .bottom)
    }
    set {
      setMargin(.bottom, newValue)
    }
  }

  var marginStart: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .start)
    }
    set {
      setMargin(.start, newValue)
    }
  }

  var marginEnd: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .end)
    }
    set {
      setMargin(.end, newValue)
    }
  }

  var marginHorizontal: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .horizontal)
    }
    set {
      setMargin(.horizontal, newValue)
    }
  }

  var marginVertical: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .vertical)
    }
    set {
      setMargin(.vertical, newValue)
    }
  }

  var margin: YGValueType {
    get {
      return YGNodeStyleGetMargin(node, .all)
    }
    set {
      setMargin(.all, newValue)
    }
  }

  var paddingLeft: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .left)
    }
    set {
      setPadding(.left, newValue)
    }
  }

  var paddingTop: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .top)
    }
    set {
      setPadding(.top, newValue)
    }
  }

  var paddingRight: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .right)
    }
    set {
      setPadding(.right, newValue)
    }
  }

  var paddingBottom: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .bottom)
    }
    set {
      setPadding(.bottom, newValue)
    }
  }

  var paddingStart: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .start)
    }
    set {
      setPadding(.start, newValue)
    }
  }

  var paddingEnd: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .end)
    }
    set {
      setPadding(.end, newValue)
    }
  }

  var paddingHorizontal: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .horizontal)
    }
    set {
      setPadding(.horizontal, newValue)
    }
  }

  var paddingVertical: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .vertical)
    }
    set {
      setPadding(.vertical, newValue)
    }
  }

  var padding: YGValueType {
    get {
      return YGNodeStyleGetPadding(node, .all)
    }
    set {
      setPadding(.all, newValue)
    }
  }

  var borderLeft: Float {
    get {
      return YGNodeStyleGetBorder(node, .left)
    }
    set {
      YGNodeStyleSetBorder(node, .left, newValue)
    }
  }

  var borderTop: Float {
    get {
      return YGNodeStyleGetBorder(node, .top)
    }
    set {
      YGNodeStyleSetBorder(node, .top, newValue)
    }
  }

  var borderRight: Float {
    get {
      return YGNodeStyleGetBorder(node, .right)
    }
    set {
      YGNodeStyleSetBorder(node, .right, newValue)
    }
  }

  var borderBottom: Float {
    get {
      return YGNodeStyleGetBorder(node, .bottom)
    }
    set {
      YGNodeStyleSetBorder(node, .bottom, newValue)
    }
  }

  var borderStart: Float {
    get {
      return YGNodeStyleGetBorder(node, .start)
    }
    set {
      YGNodeStyleSetBorder(node, .start, newValue)
    }
  }

  var borderEnd: Float {
    get {
      return YGNodeStyleGetBorder(node, .end)
    }
    set {
      YGNodeStyleSetBorder(node, .end, newValue)
    }
  }

  var borderVertical: Float {
    get {
      return YGNodeStyleGetBorder(node, .vertical)
    }
    set {
      YGNodeStyleSetBorder(node, .vertical, newValue)
    }
  }

  var borderHorizontal: Float {
    get {
      return YGNodeStyleGetBorder(node, .horizontal)
    }
    set {
      YGNodeStyleSetBorder(node, .horizontal, newValue)
    }
  }

  var border: Float {
    get {
      return YGNodeStyleGetBorder(node, .all)
    }
    set {
      YGNodeStyleSetBorder(node, .all, newValue)
    }
  }

  var width: YGValueType {
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

  var height: YGValueType {
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

  var minWidth: YGValueType {
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

  var minHeight: YGValueType {
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

  var maxWidth: YGValueType {
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

  var maxHeight: YGValueType {
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
  var aspectRatio: Float {
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
  var resolvedDirection: YGDirection {
    return YGNodeLayoutGetDirection(node)
  }
}

extension YGLayout {
  func setPosition(_ edge: YGEdge, _ value: YGValueType) {
    switch value.unit {
    case .percent:
      YGNodeStyleSetPositionPercent(node, edge, value.value)
    case .point: fallthrough
    default:
      YGNodeStyleSetPosition(node, edge, value.value)
    }
  }

  func setMargin(_ edge: YGEdge, _ value: YGValueType) {
    switch value.unit {
    case .percent:
      YGNodeStyleSetMarginPercent(node, edge, value.value)
    case .point: fallthrough
    default:
      YGNodeStyleSetMargin(node, edge, value.value)
    }
  }

  func setPadding(_ edge: YGEdge, _ value: YGValueType) {
    switch value.unit {
    case .percent:
      YGNodeStyleSetPaddingPercent(node, edge, value.value)
    case .point: fallthrough
    default:
      YGNodeStyleSetPadding(node, edge, value.value)
    }
  }
}
