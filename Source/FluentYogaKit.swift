//
//  FluentYogaKit.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import YogaKit

public extension YGLayout {
    @discardableResult
    public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> Self {
        self.isIncludedInLayout = isIncludedInLayout
        return self
    }
    @discardableResult
    public func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    // MARK:
    @discardableResult
    public func direction(_ direction: YGDirection) -> Self {
        self.direction = direction
        return self
    }
    @discardableResult
    public func flexDirection(_ flexDirection: YGFlexDirection) -> Self {
        self.flexDirection = flexDirection
        return self
    }
    @discardableResult
    public func justifyContent(_ justifyContent: YGJustify) -> Self {
        self.justifyContent = justifyContent
        return self
    }
    @discardableResult
    public func alignContent(_ alignContent: YGAlign) -> Self {
        self.alignContent = alignContent
        return self
    }
    @discardableResult
    public func alignItems(_ alignItems: YGAlign) -> Self {
        self.alignItems = alignItems
        return self
    }
    @discardableResult
    public func alignSelf(_ alignSelf: YGAlign) -> Self {
        self.alignSelf = alignSelf
        return self
    }
    @discardableResult
    public func position(_ position: YGPositionType) -> Self {
        self.position = position
        return self
    }
    @discardableResult
    public func flexWrap(_ flexWrap: YGWrap) -> Self {
        self.flexWrap = flexWrap
        return self
    }
    @discardableResult
    public func overflow(_ overflow: YGOverflow) -> Self {
        self.overflow = overflow
        return self
    }
    @discardableResult
    public func display(_ display: YGDisplay) -> Self {
        self.display = display
        return self
    }
    
    // MARK:
    @discardableResult
    public func flexGrow(_ flexGrow: CGFloat) -> Self {
        self.flexGrow = flexGrow
        return self
    }
    @discardableResult
    public func flexShrink(_ flexShrink: CGFloat) -> Self {
        self.flexShrink = flexShrink
        return self
    }
    @discardableResult
    public func flexBasis(_ flexBasis: YGValue) -> Self {
        self.flexBasis = flexBasis
        return self
    }
    
    // MARK:
    @discardableResult
    public func left(_ left: YGValue) -> Self {
        self.left = left
        return self
    }
    @discardableResult
    public func top(_ top: YGValue) -> Self {
        self.top = top
        return self
    }
    @discardableResult
    public func right(_ right: YGValue) -> Self {
        self.right = right
        return self
    }
    @discardableResult
    public func bottom(_ bottom: YGValue) -> Self {
        self.bottom = bottom
        return self
    }
    @discardableResult
    public func start(_ start: YGValue) -> Self {
        self.start = start
        return self
    }
    @discardableResult
    public func end(_ end: YGValue) -> Self {
        self.end = end
        return self
    }
    
    // MARK:
    @discardableResult
    public func marginLeft(_ marginLeft: YGValue) -> Self {
        self.marginLeft = marginLeft
        return self
    }
    @discardableResult
    public func marginTop(_ marginTop: YGValue) -> Self {
        self.marginTop = marginTop
        return self
    }
    @discardableResult
    public func marginRight(_ marginRight: YGValue) -> Self {
        self.marginRight = marginRight
        return self
    }
    @discardableResult
    public func marginBottom(_ marginBottom: YGValue) -> Self {
        self.marginBottom = marginBottom
        return self
    }
    @discardableResult
    public func marginStart(_ marginStart: YGValue) -> Self {
        self.marginStart = marginStart
        return self
    }
    @discardableResult
    public func marginEnd(_ marginEnd: YGValue) -> Self {
        self.marginEnd = marginEnd
        return self
    }
    @discardableResult
    public func marginHorizontal(_ marginHorizontal: YGValue) -> Self {
        self.marginHorizontal = marginHorizontal
        return self
    }
    @discardableResult
    public func marginVertical(_ marginVertical: YGValue) -> Self {
        self.marginVertical = marginVertical
        return self
    }
    @discardableResult
    public func margin(_ margin: YGValue) -> Self {
        self.margin = margin
        return self
    }
    
    // MARK:
    @discardableResult
    public func paddingLeft(_ paddingLeft: YGValue) -> Self {
        self.paddingLeft = paddingLeft
        return self
    }
    @discardableResult
    public func paddingRight(_ paddingRight: YGValue) -> Self {
        self.paddingRight = paddingRight
        return self
    }
    @discardableResult
    public func paddingTop(_ paddingTop: YGValue) -> Self {
        self.paddingTop = paddingTop
        return self
    }
    @discardableResult
    public func paddingBottom(_ paddingBottom: YGValue) -> Self {
        self.paddingBottom = paddingBottom
        return self
    }
    @discardableResult
    public func paddingStart(_ paddingStart: YGValue) -> Self {
        self.paddingStart = paddingStart
        return self
    }
    @discardableResult
    public func paddingEnd(_ paddingEnd: YGValue) -> Self {
        self.paddingEnd = paddingEnd
        return self
    }
    @discardableResult
    public func paddingVertical(_ paddingVertical: YGValue) -> Self {
        self.paddingVertical = paddingVertical
        return self
    }
    @discardableResult
    public func paddingHorizontal(_ paddingHorizontal: YGValue) -> Self {
        self.paddingHorizontal = paddingHorizontal
        return self
    }
    @discardableResult
    public func padding(_ padding: YGValue) -> Self {
        self.padding = padding
        return self
    }
    
    // MARK:
    @discardableResult
    public func borderLeftWidth(_ borderLeftWidth: CGFloat) -> Self {
        self.borderLeftWidth = borderLeftWidth
        return self
    }
    @discardableResult
    public func borderTopWidth(_ borderTopWidth: CGFloat) -> Self {
        self.borderTopWidth = borderTopWidth
        return self
    }
    @discardableResult
    public func borderRightWidth(_ borderRightWidth: CGFloat) -> Self {
        self.borderRightWidth = borderRightWidth
        return self
    }
    @discardableResult
    public func borderBottomWidth(_ borderBottomWidth: CGFloat) -> Self {
        self.borderBottomWidth = borderBottomWidth
        return self
    }
    @discardableResult
    public func borderStartWidth(_ borderStartWidth: CGFloat) -> Self {
        self.borderStartWidth = borderStartWidth
        return self
    }
    @discardableResult
    public func borderEndWidth(_ borderEndWidth: CGFloat) -> Self {
        self.borderEndWidth = borderEndWidth
        return self
    }
    @discardableResult
    public func borderWidth(_ borderWidth: CGFloat) -> Self {
        self.borderWidth = borderWidth
        return self
    }
    
    // MARK:
    @discardableResult
    public func width(_ width: YGValue) -> Self {
        self.width = width
        return self
    }
    @discardableResult
    public func height(_ height: YGValue) -> Self {
        self.height = height
        return self
    }
    @discardableResult
    public func size(width: YGValue, height: YGValue) -> Self {
        self.height = height
        self.width = width
        return self
    }
    @discardableResult
    public func size(_ size: YGSize) -> Self {
        self.height = YGValue(size.height)
        self.width = YGValue(size.width)
        return self
    }
    @discardableResult
    public func minWidth(_ minWidth: YGValue) -> Self {
        self.minWidth = minWidth
        return self
    }
    @discardableResult
    public func minHeight(_ minHeight: YGValue) -> Self {
        self.minHeight = minHeight
        return self
    }
    @discardableResult
    public func minSize(_ size: YGSize) -> Self {
        self.minHeight = YGValue(size.height)
        self.minWidth = YGValue(size.width)
        return self
    }
    @discardableResult
    public func minSize(width: YGValue, height: YGValue) -> Self {
        self.minHeight = height
        self.minWidth = width
        return self
    }
    @discardableResult
    public func maxWidth(_ maxWidth: YGValue) -> Self {
        self.maxWidth = maxWidth
        return self
    }
    @discardableResult
    public func maxHeight(_ maxHeight: YGValue) -> Self {
        self.maxHeight = maxHeight
        return self
    }    
    @discardableResult
    public func maxSize(_ size: YGSize) -> Self {
        self.maxHeight = YGValue(size.height)
        self.maxWidth = YGValue(size.width)
        return self
    }
    @discardableResult
    public func maxSize(width: YGValue, height: YGValue) -> Self {
        self.maxHeight = height
        self.maxWidth = width
        return self
    }

    @discardableResult
    public func aspectRatio(_ aspectRatio: CGFloat) -> Self {
        self.aspectRatio = aspectRatio
        return self
    }
}
