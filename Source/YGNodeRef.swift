//
//  YGNodeRef.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/29/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: - YGNodeRef -

private let YGNodeMeasureFunc: YGMeasureFunc = {
  (node: YGNodeRef?, width: Float, widthMode: YGMeasureMode, height: Float, heightMode: YGMeasureMode) -> YGSize in
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
  private static let globalConfig: YGConfigRef? = {
    let config = YGConfigNew()
    YGConfigSetExperimentalFeatureEnabled(config, .webFlexBasis, true)
    YGConfigSetPointScaleFactor(config, Float(scaleFactor))

    return config
  }()

  init() {
    self = YGNodeNewWithConfig(YGNodeRef.globalConfig)
  }

  static func dummy() -> YGNodeRef {
    let dummy = YGNodeRef()

    YGNodeStyleSetWidth(dummy, 0)
    YGNodeStyleSetHeight(dummy, 0)

    return dummy
  }

  var layoutTop: CGFloat {
    return YGNodeLayoutGetTop(self).cgValue
  }

  var layoutLeft: CGFloat {
    return YGNodeLayoutGetLeft(self).cgValue
  }

  var layoutWidth: CGFloat {
    return YGNodeLayoutGetWidth(self).cgValue
  }

  var layoutHeight: CGFloat {
    return YGNodeLayoutGetHeight(self).cgValue
  }

  func getParent() -> YGNodeRef? {
    return YGNodeGetParent(self)
  }

  func getChild(at index: Int) -> YGNodeRef? {
    return YGNodeGetChild(self, UInt32(index))
  }

  func insertChild(_ child: YGNodeRef, at index: Int) {
    YGNodeInsertChild(self, child, UInt32(index))
  }

  func removeChild(_ child: YGNodeRef) {
    YGNodeRemoveChild(self, child)
  }

  func existMeasureFunc() -> Bool {
    return YGNodeGetMeasureFunc(self) != nil
  }

  func setMeasureFunc() {
    YGNodeSetMeasureFunc(self, YGNodeMeasureFunc)
  }

  func removeMeasureFunc() {
    YGNodeSetMeasureFunc(self, nil)
  }

  fileprivate func sanitizeMeasurement(_ constrainedSize: Float, _ measuredSize: Float,
                                       _ measureMode: YGMeasureMode) -> Float {
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

  func calculateLayout(size: YGSize, direction: YGDirection) {
    YGNodeCalculateLayout(self, size.width, size.height, direction)
  }

  var isDirty: Bool {
    return YGNodeIsDirty(self)
  }

  func markDirty() {
    YGNodeMarkDirty(self)
  }
}

// MARK: - Layout association -

private var YGNodeViewContext = NSMapTable<NSNumber, UIView>.weakToWeakObjects()

extension YGNodeRef {
  func attachView(_ view: UIView) {
    YGNodeViewContext.setObject(view, forKey: yogaKey)
  }

  func detachView() {
    YGNodeViewContext.removeObject(forKey: yogaKey)
  }

  var view: UIView? {
    return YGNodeViewContext.object(forKey: yogaKey)
  }

  var yogaKey: NSNumber {
    return NSNumber(integerLiteral: hashValue)
  }
}
