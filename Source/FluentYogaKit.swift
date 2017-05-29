//
//  FluentYogaKit.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

public extension YGLayout {
    /*
     - set on item itself
     - should include this view when calculating layout?
     - // true (default)
    */
    @discardableResult
    public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> Self {
        self.isIncludedInLayout = isIncludedInLayout
        return self
    }
    
    /*
     - set on item itself
     - decides during layout/sizing whether or not styling properties should be applied
     - false (default)
    */
    @discardableResult
    public func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
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
     - default size of an item on the main axis (before any flexGrow and flexShrink calculations are performed)
     - ~ the width of the item if its parent is a container with flexDirection = row
     - ~ the height of the item if its parent is a container with flexDirection = column
     - value: 0 (default), float => 0
     */
    @discardableResult
    public func flexBasis(_ flexBasis: Float) -> Self {
        self.flexBasis = flexBasis
        return self
    }
    
    // MARK:
    
    /* 
     - in case of position = absolute
     - set on item itself
     */
    @discardableResult
    public func left(_ left: Float) -> Self {
        self.left = left
        return self
    }
    @discardableResult
    public func top(_ top: Float) -> Self {
        self.top = top
        return self
    }
    @discardableResult
    public func right(_ right: Float) -> Self {
        self.right = right
        return self
    }
    @discardableResult
    public func bottom(_ bottom: Float) -> Self {
        self.bottom = bottom
        return self
    }
    @discardableResult
    public func start(_ start: Float) -> Self {
        self.start = start
        return self
    }
    @discardableResult
    public func end(_ end: Float) -> Self {
        self.end = end
        return self
    }
    
    // MARK:
    @discardableResult
    public func marginLeft(_ marginLeft: Float) -> Self {
        self.marginLeft = marginLeft
        return self
    }
    @discardableResult
    public func marginTop(_ marginTop: Float) -> Self {
        self.marginTop = marginTop
        return self
    }
    @discardableResult
    public func marginRight(_ marginRight: Float) -> Self {
        self.marginRight = marginRight
        return self
    }
    @discardableResult
    public func marginBottom(_ marginBottom: Float) -> Self {
        self.marginBottom = marginBottom
        return self
    }
    @discardableResult
    public func marginStart(_ marginStart: Float) -> Self {
        self.marginStart = marginStart
        return self
    }
    @discardableResult
    public func marginEnd(_ marginEnd: Float) -> Self {
        self.marginEnd = marginEnd
        return self
    }
    @discardableResult
    public func marginHorizontal(_ marginHorizontal: Float) -> Self {
        self.marginHorizontal = marginHorizontal
        return self
    }
    @discardableResult
    public func marginVertical(_ marginVertical: Float) -> Self {
        self.marginVertical = marginVertical
        return self
    }
    @discardableResult
    public func margin(_ margin: Float) -> Self {
        self.margin = margin
        return self
    }
    
    // MARK:
    @discardableResult
    public func paddingLeft(_ paddingLeft: Float) -> Self {
        self.paddingLeft = paddingLeft
        return self
    }
    @discardableResult
    public func paddingRight(_ paddingRight: Float) -> Self {
        self.paddingRight = paddingRight
        return self
    }
    @discardableResult
    public func paddingTop(_ paddingTop: Float) -> Self {
        self.paddingTop = paddingTop
        return self
    }
    @discardableResult
    public func paddingBottom(_ paddingBottom: Float) -> Self {
        self.paddingBottom = paddingBottom
        return self
    }
    @discardableResult
    public func paddingStart(_ paddingStart: Float) -> Self {
        self.paddingStart = paddingStart
        return self
    }
    @discardableResult
    public func paddingEnd(_ paddingEnd: Float) -> Self {
        self.paddingEnd = paddingEnd
        return self
    }
    @discardableResult
    public func paddingVertical(_ paddingVertical: Float) -> Self {
        self.paddingVertical = paddingVertical
        return self
    }
    @discardableResult
    public func paddingHorizontal(_ paddingHorizontal: Float) -> Self {
        self.paddingHorizontal = paddingHorizontal
        return self
    }
    @discardableResult
    public func padding(_ padding: Float) -> Self {
        self.padding = padding
        return self
    }
    
    // MARK:
    @discardableResult
    public func borderLeftWidth(_ borderLeftWidth: Float) -> Self {
        self.borderLeftWidth = borderLeftWidth
        return self
    }
    @discardableResult
    public func borderTopWidth(_ borderTopWidth: Float) -> Self {
        self.borderTopWidth = borderTopWidth
        return self
    }
    @discardableResult
    public func borderRightWidth(_ borderRightWidth: Float) -> Self {
        self.borderRightWidth = borderRightWidth
        return self
    }
    @discardableResult
    public func borderBottomWidth(_ borderBottomWidth: Float) -> Self {
        self.borderBottomWidth = borderBottomWidth
        return self
    }
    @discardableResult
    public func borderStartWidth(_ borderStartWidth: Float) -> Self {
        self.borderStartWidth = borderStartWidth
        return self
    }
    @discardableResult
    public func borderEndWidth(_ borderEndWidth: Float) -> Self {
        self.borderEndWidth = borderEndWidth
        return self
    }
    @discardableResult
    public func borderWidth(_ borderWidth: Float) -> Self {
        self.borderWidth = borderWidth
        return self
    }
    
    // MARK:
    @discardableResult
    public func width(_ width: Float) -> Self {
        self.width = width
        return self
    }
    @discardableResult
    public func height(_ height: Float) -> Self {
        self.height = height
        return self
    }
    @discardableResult
    public func size(width: Float, height: Float) -> Self {
        self.height = height
        self.width = width
        return self
    }
    @discardableResult
    public func size(_ size: YGSize) -> Self {
        self.height = size.height
        self.width = size.width
        return self
    }
    @discardableResult
    public func minWidth(_ minWidth: Float) -> Self {
        self.minWidth = minWidth
        return self
    }
    @discardableResult
    public func minHeight(_ minHeight: Float) -> Self {
        self.minHeight = minHeight
        return self
    }
    @discardableResult
    public func minSize(_ size: YGSize) -> Self {
        self.minHeight = size.height
        self.minWidth = size.width
        return self
    }
    @discardableResult
    public func minSize(width: Float, height: Float) -> Self {
        self.minHeight = height
        self.minWidth = width
        return self
    }
    @discardableResult
    public func maxWidth(_ maxWidth: Float) -> Self {
        self.maxWidth = maxWidth
        return self
    }
    @discardableResult
    public func maxHeight(_ maxHeight: Float) -> Self {
        self.maxHeight = maxHeight
        return self
    }    
    @discardableResult
    public func maxSize(_ size: YGSize) -> Self {
        self.maxHeight = size.height
        self.maxWidth = size.width
        return self
    }
    @discardableResult
    public func maxSize(width: Float, height: Float) -> Self {
        self.maxHeight = height
        self.maxWidth = width
        return self
    }

    // MARK:
    // width / height, e.g. 0.5 (w = 1/2 h), 2.0 (w = 2 h)
    @discardableResult
    public func aspectRatio(_ aspectRatio: Float) -> Self {
        self.aspectRatio = aspectRatio
        return self
    }

    //*NOTE: Mix of max/min vs. flexGrow/flexShrink
}
