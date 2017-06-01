//
//  Fluent.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

extension YGLayoutElement {
    // MARK:
    /*
     - set on item itself
     - should include this view when calculating layout?
     - // true (default)
    */
    @discardableResult
    public func isIncluded(_ isIncluded: Bool) -> Self {
        self.isIncluded = isIncluded
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
    public func top(_ top: Float) -> Self {
        self.top = top
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
    @discardableResult
    public func left(_ left: Float) -> Self {
        self.left = left
        return self
    }
    @discardableResult
    public func right(_ right: Float) -> Self {
        self.right = right
        return self
    }
    
    // MARK:
    @discardableResult
    public func marginTop(_ marginTop: Float) -> Self {
        self.marginTop = marginTop
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
    public func marginLeft(_ marginLeft: Float) -> Self {
        self.marginLeft = marginLeft
        return self
    }
    @discardableResult
    public func marginRight(_ marginRight: Float) -> Self {
        self.marginRight = marginRight
        return self
    }
    @discardableResult
    public func marginVertical(_ marginVertical: Float) -> Self {
        self.marginVertical = marginVertical
        return self
    }
    @discardableResult
    public func marginHorizontal(_ marginHorizontal: Float) -> Self {
        self.marginHorizontal = marginHorizontal
        return self
    }
    @discardableResult
    public func margin(_ margin: Float) -> Self {
        self.margin = margin
        return self
    }
    
    // MARK:
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

    @discardableResult
    public func sizeRange(min: YGSize, max: YGSize) -> Self {
        minSize(min)
        maxSize(max)
        return self
    }
    @discardableResult
    public func sizeRange(minWidth: Float, minHeight: Float, maxWidth: Float, maxHeight: Float) -> Self {
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

    //*NOTE: Mix of max/min vs. flexGrow/flexShrink
}

//TODO
//https://bugs.swift.org/browse/SR-128
//https://stackoverflow.com/questions/24024376/passing-an-array-to-a-function-with-variable-number-of-args-in-swift
//func splatVariadicArgs<T>(_ args: T...) -> [T] {
//    return args
//}

// MARK:
extension YGLayoutElement {
    // MARK:
    convenience public init(vertical: YGLayoutElement...) {
        self.init()
        flexDirectionSubelements(.column, vertical)
    }
    convenience public init(vertical: [YGLayoutElement]) {
        self.init()
        flexDirectionSubelements(.column, vertical)
    }

    convenience public init(horizontal: YGLayoutElement...) {
        self.init()
        flexDirectionSubelements(.row, horizontal)
    }
    convenience public init(horizontal: [YGLayoutElement]) {
        self.init()
        flexDirectionSubelements(.row, horizontal)
    }

    @discardableResult
    public func vertical(_ subelements: YGLayoutElement...) -> Self {
        return flexDirectionSubelements(.column, subelements)
    }
    
    @discardableResult
    public func horizontal(_ subelements: YGLayoutElement...) -> Self {
        return flexDirectionSubelements(.row, subelements)
    }

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
    
    @discardableResult
    internal func flexDirectionSubelements(_ flexDirection: YGFlexDirection,_ subelements: [YGLayoutElement]) -> Self {
        return subelement(subelements)
            .flexDirection(flexDirection)
    }
    
// For those who is flexbox newbie
    @discardableResult
    public func mainAxis(align: YGJustify) -> Self {
        return justifyContent(align)
    }

//TODO: Need understand more then implement later
//    @discardableResult
//    public func mainWrap(align: YGAlign) -> Self {
//        return alignContent(align)
//    }

    @discardableResult
    public func crossAxis(align: YGAlign) -> Self {
        return alignItems(align)
    }
    
    @discardableResult
    public func crossSelf(align: YGAlign) -> Self {
        return alignSelf(align)
    }
}

// MARK:
extension YGLayoutView {
    // MARK:
    convenience public init(view: UIView, vertical: YGLayoutElement...) {
        self.init(view: view)
        flexDirectionSubelements(.column, vertical)
    }

    convenience public init(view: UIView, horizontal: YGLayoutElement...) {
        self.init(view: view)
        flexDirectionSubelements(.row, horizontal)
    }
    
}
