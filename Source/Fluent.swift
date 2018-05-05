//
//  Fluent.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: Basic flexbox -

extension YGLayout {

  // MARK:

  /*
   - set on item itself
   - decides during layout/sizing whether or not styling properties should be applied
   - true (default)
   - recursive: apply to the whole tree
   */
  @discardableResult
  public func isEnabled(_ isEnabled: Bool, recursive: Bool = true) -> Self {
    if isEnabled != self.isEnabled {
      if recursive {
        isRecursiveEnabled = isEnabled
      } else {
        self.isEnabled = isEnabled
        markView(hidden: !isEnabled)
      }

      markNode(dummy: !isEnabled)
    }

    return self
  }

  // MARK:

  /*
   - set on item itself
   - relative (default), absolute
   */
  @discardableResult
  public func position(_ position: YGPositionType) -> Self {
    self.position = position
    return self
  }

  /*
   - set on containers
   - inherit (default), LTR, RTL
   */
  @discardableResult
  public func direction(_ direction: YGDirection) -> Self {
    self.direction = direction
    return self
  }

  /*
   - set on containers
   - value: column (default)/row/columnReverse/rowReverse
   */
  @discardableResult
  public func flexDirection(_ flexDirection: YGFlexDirection) -> Self {
    self.flexDirection = flexDirection
    return self
  }

  /*
   - set on containers
   - main axis
   - value: flexStart (default)/flexEnd/center/spaceBetween/spaceAround
   */
  @discardableResult
  public func justifyContent(_ justifyContent: YGJustify) -> Self {
    self.justifyContent = justifyContent
    return self
  }

  /*
   - set on containers
   - cross axis
   - value: flexStart/flexEnd/center/stretch (default)
   */
  @discardableResult
  public func alignItems(_ alignItems: YGAlign) -> Self {
    self.alignItems = alignItems
    return self
  }

  /*
   - set on item itself
   - override alignItems
   - value: flexStart/flexEnd/center/stretch (default)
   */
  @discardableResult
  public func alignSelf(_ alignSelf: YGAlign) -> Self {
    self.alignSelf = alignSelf
    return self
  }

  /*
   - set on containers
   - control how multiple lines of content are aligned within a container which uses [flexWrap = wrap]
   - only 1 line -> no impact at all
   => think line as item in cross axis
   - value: flexStart (default)/flexEnd/center/stretch/spaceBetween/spaceAround
   */
  @discardableResult
  public func alignContent(_ alignContent: YGAlign) -> Self {
    self.alignContent = alignContent
    return self
  }

  // MARK:

  /*
   - set on containers
   - controls when children overflow the size of the container along the main axis
   - value: nowrap (default)/wrap/wrapReverse
   */
  @discardableResult
  public func flexWrap(_ flexWrap: YGWrap) -> Self {
    self.flexWrap = flexWrap
    return self
  }

  /*
   - used for flexWrap = nowrap???
   - value: visible (default???)/hidden/scroll
   */
  @discardableResult
  public func overflow(_ overflow: YGOverflow) -> Self {
    self.overflow = overflow
    return self
  }

  /*
   - value: flex/none
   */
  @discardableResult
  public func display(_ display: YGDisplay) -> Self {
    self.display = display
    return self
  }

  // MARK:

  /*
   - set on item itself
   - how to distribute any remaining space in the MAIN AXIS
   - value: 0 (default), float => 0
   */
  @discardableResult
  public func flexGrow(_ flexGrow: Float) -> Self {
    self.flexGrow = flexGrow
    return self
  }

  /*
   - set on item itself
   - how to shrink when the total size of the children overflow the size of the container on the MAIN AXIS
   - value: 0 (default), float => 0
   */
  @discardableResult
  public func flexShrink(_ flexShrink: Float) -> Self {
    self.flexShrink = flexShrink
    return self
  }

  /*
   - set on item itself
   - default size of an item on the MAIN AXIS (before any flexGrow and flexShrink calculations are performed)
   - ~ the width of the item if its parent is a container with flexDirection = row
   - ~ the height of the item if its parent is a container with flexDirection = column
   - value: 0 (default), float => 0
   */
  @discardableResult
  public func flexBasis(_ flexBasis: YGValueType) -> Self {
    self.flexBasis = flexBasis
    return self
  }

  // MARK:

  /*
   - in case of position = absolute
   - set on item itself
   */
  @discardableResult
  public func top(_ top: YGValueType) -> Self {
    self.top = top
    return self
  }

  @discardableResult
  public func bottom(_ bottom: YGValueType) -> Self {
    self.bottom = bottom
    return self
  }

  @discardableResult
  public func start(_ start: YGValueType) -> Self {
    self.start = start
    return self
  }

  @discardableResult
  public func end(_ end: YGValueType) -> Self {
    self.end = end
    return self
  }

  @discardableResult
  public func left(_ left: YGValueType) -> Self {
    self.left = left
    return self
  }

  @discardableResult
  public func right(_ right: YGValueType) -> Self {
    self.right = right
    return self
  }

  // MARK:

  @discardableResult
  public func marginTop(_ marginTop: YGValueType) -> Self {
    self.marginTop = marginTop
    return self
  }

  @discardableResult
  public func marginBottom(_ marginBottom: YGValueType) -> Self {
    self.marginBottom = marginBottom
    return self
  }

  @discardableResult
  public func marginStart(_ marginStart: YGValueType) -> Self {
    self.marginStart = marginStart
    return self
  }

  @discardableResult
  public func marginEnd(_ marginEnd: YGValueType) -> Self {
    self.marginEnd = marginEnd
    return self
  }

  @discardableResult
  public func marginLeft(_ marginLeft: YGValueType) -> Self {
    self.marginLeft = marginLeft
    return self
  }

  @discardableResult
  public func marginRight(_ marginRight: YGValueType) -> Self {
    self.marginRight = marginRight
    return self
  }

  @discardableResult
  public func marginVertical(_ marginVertical: YGValueType) -> Self {
    self.marginVertical = marginVertical
    return self
  }

  @discardableResult
  public func marginHorizontal(_ marginHorizontal: YGValueType) -> Self {
    self.marginHorizontal = marginHorizontal
    return self
  }

  @discardableResult
  public func margin(_ margin: YGValueType) -> Self {
    self.margin = margin
    return self
  }

  // MARK:

  @discardableResult
  public func paddingTop(_ paddingTop: YGValueType) -> Self {
    self.paddingTop = paddingTop
    return self
  }

  @discardableResult
  public func paddingBottom(_ paddingBottom: YGValueType) -> Self {
    self.paddingBottom = paddingBottom
    return self
  }

  @discardableResult
  public func paddingStart(_ paddingStart: YGValueType) -> Self {
    self.paddingStart = paddingStart
    return self
  }

  @discardableResult
  public func paddingEnd(_ paddingEnd: YGValueType) -> Self {
    self.paddingEnd = paddingEnd
    return self
  }

  @discardableResult
  public func paddingLeft(_ paddingLeft: YGValueType) -> Self {
    self.paddingLeft = paddingLeft
    return self
  }

  @discardableResult
  public func paddingRight(_ paddingRight: YGValueType) -> Self {
    self.paddingRight = paddingRight
    return self
  }

  @discardableResult
  public func paddingVertical(_ paddingVertical: YGValueType) -> Self {
    self.paddingVertical = paddingVertical
    return self
  }

  @discardableResult
  public func paddingHorizontal(_ paddingHorizontal: YGValueType) -> Self {
    self.paddingHorizontal = paddingHorizontal
    return self
  }

  @discardableResult
  public func padding(_ padding: YGValueType) -> Self {
    self.padding = padding
    return self
  }

  // MARK:

  @discardableResult
  public func borderTop(_ borderTop: Float) -> Self {
    self.borderTop = borderTop
    return self
  }

  @discardableResult
  public func borderBottom(_ borderBottom: Float) -> Self {
    self.borderBottom = borderBottom
    return self
  }

  @discardableResult
  public func borderStart(_ borderStart: Float) -> Self {
    self.borderStart = borderStart
    return self
  }

  @discardableResult
  public func borderEnd(_ borderEnd: Float) -> Self {
    self.borderEnd = borderEnd
    return self
  }

  @discardableResult
  public func borderLeft(_ borderLeft: Float) -> Self {
    self.borderLeft = borderLeft
    return self
  }

  @discardableResult
  public func borderRight(_ borderRight: Float) -> Self {
    self.borderRight = borderRight
    return self
  }

  @discardableResult
  public func borderVertical(_ borderVertical: Float) -> Self {
    self.borderVertical = borderVertical
    return self
  }

  @discardableResult
  public func borderHorizontal(_ borderHorizontal: Float) -> Self {
    self.borderHorizontal = borderHorizontal
    return self
  }

  @discardableResult
  public func border(_ border: Float) -> Self {
    self.border = border
    return self
  }

  // MARK:

  @discardableResult
  public func width(_ width: YGValueType) -> Self {
    self.width = width
    return self
  }

  @discardableResult
  public func height(_ height: YGValueType) -> Self {
    self.height = height
    return self
  }

  @discardableResult
  public func size(width: YGValueType, height: YGValueType) -> Self {
    self.height = height
    self.width = width
    return self
  }

  @discardableResult
  public func size(_ size: YGSize) -> Self {
    height = size.height
    width = size.height
    return self
  }

  @discardableResult
  public func minWidth(_ minWidth: YGValueType) -> Self {
    self.minWidth = minWidth
    return self
  }

  @discardableResult
  public func minHeight(_ minHeight: YGValueType) -> Self {
    self.minHeight = minHeight
    return self
  }

  @discardableResult
  public func minSize(_ size: YGSize) -> Self {
    minHeight = size.height
    minWidth = size.width
    return self
  }

  @discardableResult
  public func minSize(width: YGValueType, height: YGValueType) -> Self {
    minHeight = height
    minWidth = width
    return self
  }

  @discardableResult
  public func maxWidth(_ maxWidth: YGValueType) -> Self {
    self.maxWidth = maxWidth
    return self
  }

  @discardableResult
  public func maxHeight(_ maxHeight: YGValueType) -> Self {
    self.maxHeight = maxHeight
    return self
  }

  @discardableResult
  public func maxSize(_ size: YGSize) -> Self {
    maxHeight = size.height
    maxWidth = size.width
    return self
  }

  @discardableResult
  public func maxSize(width: YGValueType, height: YGValueType) -> Self {
    maxHeight = height
    maxWidth = width
    return self
  }

  @discardableResult
  public func sizeRange(min: YGSize, max: YGSize) -> Self {
    minSize(min)
    maxSize(max)
    return self
  }

  @discardableResult
  public func sizeRange(minWidth: YGValueType, minHeight: YGValueType, maxWidth: YGValueType, maxHeight: YGValueType) -> Self {
    minSize(width: minWidth, height: minHeight)
    maxSize(width: maxWidth, height: maxHeight)
    return self
  }

  // MARK:

  // width / height, e.g. 0.5 (w = 1/2 h), 2.0 (w = 2 h)
  @discardableResult
  public func aspectRatio(_ aspectRatio: Float) -> Self {
    self.aspectRatio = aspectRatio
    return self
  }

  // *NOTE: Mix of max/min vs. flexGrow/flexShrink
}

// MARK: - Flexbox for newbie -

extension YGLayout {
  @discardableResult
  public func reverse() -> Self {
    switch flexDirection {
    case .column:
      flexDirection(.columnReverse)
    case .row:
      flexDirection(.rowReverse)
    default:
      print("flexDirection was reverved, should we reverse again???")
    }

    return self
  }

  // For those who is a flexbox newbie
  @discardableResult
  public func mainAxis(align: YGJustify) -> Self {
    return justifyContent(align)
  }

  @discardableResult
  public func crossAxis(align: YGAlign) -> Self {
    return alignItems(align)
  }

  @discardableResult
  public func crossAxisIfWrap(align: YGAlign) -> Self {
    return alignContent(align)
  }

  @discardableResult
  public func crossAxisSelf(align: YGAlign) -> Self {
    return alignSelf(align)
  }
}

// MARK: - Pin layout -

extension YGLayout {
  public class func spacer() -> YGLayout {
    return YGLayout().flexGrow(1).crossAxisSelf(align: .stretch)
  }

  public class func vTop(hAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.column, sublayouts)
      .mainAxis(align: .flexStart)
      .crossAxis(align: hAlign)
  }

  public class func vCenter(hAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.column, sublayouts)
      .mainAxis(align: .center)
      .crossAxis(align: hAlign)
  }

  public class func vBottom(hAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.column, sublayouts)
      .mainAxis(align: .flexEnd)
      .crossAxis(align: hAlign)
  }

  public class func vSpace(vAlign: YGJustify = .spaceBetween, hAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.column, sublayouts)
      .mainAxis(align: vAlign)
      .crossAxis(align: hAlign)
  }

  public class func vWrap(hAlign: YGAlign = .flexStart, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.column, sublayouts)
      .crossAxisIfWrap(align: hAlign)
  }

  public class func hStart(vAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.row, sublayouts)
      .mainAxis(align: .flexStart)
      .crossAxis(align: vAlign)
  }

  public class func hCenter(vAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.row, sublayouts)
      .mainAxis(align: .center)
      .crossAxis(align: vAlign)
  }

  public class func hEnd(vAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.row, sublayouts)
      .mainAxis(align: .flexEnd)
      .crossAxis(align: vAlign)
  }

  public class func hSpace(hAlign: YGJustify = .spaceBetween, vAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.row, sublayouts)
      .mainAxis(align: hAlign)
      .crossAxis(align: vAlign)
  }

  public class func hWrap(vAlign: YGAlign = .flexStart, _ sublayouts: Any...) -> YGLayout {
    return YGLayout().config(.row, sublayouts)
      .crossAxisIfWrap(align: vAlign)
  }

  @discardableResult
  public func vTop(hAlign: YGAlign = .stretch, _ subelements: Any...) -> Self {
    return config(.column, subelements)
      .mainAxis(align: .flexStart)
      .crossAxis(align: hAlign)
  }

  @discardableResult
  public func vCenter(hAlign: YGAlign = .stretch, _ subelements: Any...) -> Self {
    return config(.column, subelements)
      .mainAxis(align: .center)
      .crossAxis(align: hAlign)
  }

  @discardableResult
  public func vBottom(hAlign: YGAlign = .stretch, _ subelements: Any...) -> Self {
    return config(.column, subelements)
      .mainAxis(align: .flexEnd)
      .crossAxis(align: hAlign)
  }

  @discardableResult
  public func vSpace(vAlign: YGJustify = .spaceBetween, hAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return config(.column, sublayouts)
      .mainAxis(align: vAlign)
      .crossAxis(align: hAlign)
  }

  @discardableResult
  public func vWrap(hAlign: YGAlign = .flexStart, _ sublayouts: Any...) -> YGLayout {
    return config(.column, sublayouts)
      .crossAxisIfWrap(align: hAlign)
  }

  @discardableResult
  public func hStart(vAlign: YGAlign = .stretch, _ subelements: Any...) -> Self {
    return config(.row, subelements)
      .mainAxis(align: .flexStart)
      .crossAxis(align: vAlign)
  }

  @discardableResult
  public func hCenter(vAlign: YGAlign = .stretch, _ subelements: Any...) -> Self {
    return config(.row, subelements)
      .mainAxis(align: .center)
      .crossAxis(align: vAlign)
  }

  @discardableResult
  public func hEnd(vAlign: YGAlign = .stretch, _ subelements: Any...) -> Self {
    return config(.row, subelements)
      .mainAxis(align: .flexEnd)
      .crossAxis(align: vAlign)
  }

  @discardableResult
  public func hSpace(hAlign: YGJustify = .spaceBetween, vAlign: YGAlign = .stretch, _ sublayouts: Any...) -> YGLayout {
    return config(.row, sublayouts)
      .mainAxis(align: hAlign)
      .crossAxis(align: vAlign)
  }

  @discardableResult
  public func hWrap(vAlign: YGAlign = .flexStart, _ sublayouts: Any...) -> YGLayout {
    return config(.row, sublayouts)
      .crossAxisIfWrap(align: vAlign)
  }

  // TODO: Swift generic: Don't know how to do e.g. center<Element>() where Element: UIView or Element: YGLayout
  @discardableResult
  public func center(_ subview: UIView) -> Self {
    return _center(subview)
  }

  @discardableResult
  public func center(_ sublayout: YGLayout) -> Self {
    return _center(sublayout)
  }

  fileprivate func _center(_ subelement: Any) -> Self {
    return config(.column, [subelement])
      .mainAxis(align: .center)
      .crossAxis(align: .center)
  }

  // These must be synced with view.insertSubview(subview, at: first) -> background, view.insertSubview(subview, at: last) -> overlay
  // Use start, end instead of left, right
  @discardableResult
  public func overlay(_ overlay: UIView, edges: [YGEdge: YGValueType] = [.all: Float(0)]) -> Self {
    return _filled(by: YGLayout(view: overlay), edges: edges)
  }

  @discardableResult
  public func overlay(_ overlay: YGLayout, edges: [YGEdge: YGValueType] = [.all: Float(0)]) -> Self {
    return _filled(by: overlay, edges: edges)
  }

  @discardableResult
  public func background(_ background: UIView, edges: [YGEdge: YGValueType] = [.all: Float(0)]) -> Self {
    return _filled(by: YGLayout(view: background), edges: edges, atFirst: true)
  }

  @discardableResult
  public func background(_ background: YGLayout, edges: [YGEdge: YGValueType] = [.all: Float(0)]) -> Self {
    return _filled(by: background, edges: edges, atFirst: true)
  }

  fileprivate func _filled(by sublayout: YGLayout, edges: [YGEdge: YGValueType], atFirst: Bool = false) -> Self {
    sublayout.position(.absolute)
    var fullEdges: [YGEdge: YGValueType] = [
      .top: 0, .bottom: 0, .start: 0, .end: 0,
    ]

    edges.forEach { edge, value in
      switch edge {
      case .all:
        fullEdges[.top] = value
        fullEdges[.bottom] = value
        fullEdges[.start] = value
        fullEdges[.end] = value
      case .vertical:
        fullEdges[.top] = value
        fullEdges[.bottom] = value
      case .horizontal:
        fullEdges[.start] = value
        fullEdges[.end] = value
      default:
        fullEdges[edge] = value
      }
    }

    fullEdges.forEach { edge, value in
      sublayout._setPosition(edge, value)
    }

    handleSublayout(sublayout: sublayout, atFirst: atFirst)

    return self
  }
}
