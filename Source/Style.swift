//
//  Style.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/30/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import yoga

// MARK: - Style -
extension YGLayoutElement {
    open var direction: YGDirection {
        get {
            return YGNodeStyleGetDirection(node)
        }
        set {
            YGNodeStyleSetDirection(node, newValue)
        }
    }
    
    open var flexDirection: YGFlexDirection {
        get {
            return YGNodeStyleGetFlexDirection(node)
        }
        set {
            YGNodeStyleSetFlexDirection(node, newValue)
        }
    }
    
    open var justifyContent: YGJustify {
        get {
            return YGNodeStyleGetJustifyContent(node)
        }
        set {
            YGNodeStyleSetJustifyContent(node, newValue)
        }
    }
    
    open var alignContent: YGAlign {
        get {
            return YGNodeStyleGetAlignContent(node)
        }
        set {
            YGNodeStyleSetAlignContent(node, newValue)
        }
    }
    
    open var alignItems: YGAlign {
        get {
            return YGNodeStyleGetAlignItems(node)
        }
        set {
            YGNodeStyleSetAlignItems(node, newValue)
        }
    }
    
    open var alignSelf: YGAlign {
        get {
            return YGNodeStyleGetAlignSelf(node)
        }
        set {
            YGNodeStyleSetAlignSelf(node, newValue)
        }
    }
    
    open var position: YGPositionType {
        get {
            return YGNodeStyleGetPositionType(node)
        }
        set {
            YGNodeStyleSetPositionType(node, newValue)
        }
    }
    
    open var flexWrap: YGWrap {
        get {
            return YGNodeStyleGetFlexWrap(node)
        }
        set {
            YGNodeStyleSetFlexWrap(node, newValue)
        }
    }
    
    open var overflow: YGOverflow {
        get {
            return YGNodeStyleGetOverflow(node)
        }
        set {
            YGNodeStyleSetOverflow(node, newValue)
        }
    }
    
    open var display: YGDisplay {
        get {
            return YGNodeStyleGetDisplay(node)
        }
        set {
            YGNodeStyleSetDisplay(node, newValue)
        }
    }
    
    open var flexGrow: Float {
        get {
            return YGNodeStyleGetFlexGrow(node)
        }
        set {
            YGNodeStyleSetFlexGrow(node, newValue)
        }
    }
    
    open var flexShrink: Float {
        get {
            return YGNodeStyleGetFlexShrink(node)
        }
        set {
            YGNodeStyleSetFlexShrink(node, newValue)
        }
        
    }
    
    open var flexBasis: Float {
        get {
            return YGNodeStyleGetFlexBasis(node).value
        }
        set {
            YGNodeStyleSetFlexBasis(node, newValue)
        }
    }
    
    
    open var left: Float {
        get {
            return YGNodeStyleGetPosition(node, .left).value
        }
        set {
            YGNodeStyleSetPosition(node, .left, newValue)
        }
    }
    
    open var top: Float {
        get {
            return YGNodeStyleGetPosition(node, .top).value
        }
        set {
            YGNodeStyleSetPosition(node, .top, newValue)
        }
    }
    
    open var right: Float {
        get {
            return YGNodeStyleGetPosition(node, .right).value
        }
        set {
            YGNodeStyleSetPosition(node, .right, newValue)
        }
    }
    
    open var bottom: Float {
        get {
            return YGNodeStyleGetPosition(node, .bottom).value
        }
        set {
            YGNodeStyleSetPosition(node, .bottom, newValue)
        }
    }
    
    open var start: Float {
        get {
            return YGNodeStyleGetPosition(node, .start).value
        }
        set {
            YGNodeStyleSetPosition(node, .start, newValue)
        }
    }
    
    open var end: Float {
        get {
            return YGNodeStyleGetPosition(node, .end).value
        }
        set {
            YGNodeStyleSetPosition(node, .end, newValue)
        }
    }
    
    
    open var marginLeft: Float {
        get {
            return YGNodeStyleGetMargin(node, .left).value
        }
        set {
            YGNodeStyleSetMargin(node, .left, newValue)
        }
    }
    
    open var marginTop: Float {
        get {
            return YGNodeStyleGetMargin(node, .top).value
        }
        set {
            YGNodeStyleSetMargin(node, .top, newValue)
        }
    }
    
    open var marginRight: Float {
        get {
            return YGNodeStyleGetMargin(node, .right).value
        }
        set {
            YGNodeStyleSetMargin(node, .right, newValue)
        }
    }
    
    open var marginBottom: Float {
        get {
            return YGNodeStyleGetMargin(node, .bottom).value
        }
        set {
            YGNodeStyleSetMargin(node, .bottom, newValue)
        }
    }
    
    open var marginStart: Float {
        get {
            return YGNodeStyleGetMargin(node, .start).value
        }
        set {
            YGNodeStyleSetMargin(node, .start, newValue)
        }
    }
    
    open var marginEnd: Float {
        get {
            return YGNodeStyleGetMargin(node, .end).value
        }
        set {
            YGNodeStyleSetMargin(node, .end, newValue)
        }
    }
    
    open var marginHorizontal: Float {
        get {
            return YGNodeStyleGetMargin(node, .horizontal).value
        }
        set {
            YGNodeStyleSetMargin(node, .horizontal, newValue)
        }
    }
    
    open var marginVertical: Float {
        get {
            return YGNodeStyleGetMargin(node, .vertical).value
        }
        set {
            YGNodeStyleSetMargin(node, .vertical, newValue)
        }
    }
    
    open var margin: Float {
        get {
            return YGNodeStyleGetMargin(node, .all).value
        }
        set {
            YGNodeStyleSetMargin(node, .all, newValue)
        }
    }
    
    
    open var paddingLeft: Float {
        get {
            return YGNodeStyleGetPadding(node, .left).value
        }
        set {
            YGNodeStyleSetPadding(node, .left, newValue)
        }
    }
    
    open var paddingTop: Float {
        get {
            return YGNodeStyleGetPadding(node, .top).value
        }
        set {
            YGNodeStyleSetPadding(node, .top, newValue)
        }
    }
    
    open var paddingRight: Float {
        get {
            return YGNodeStyleGetPadding(node, .right).value
        }
        set {
            YGNodeStyleSetPadding(node, .right, newValue)
        }
    }
    
    open var paddingBottom: Float {
        get {
            return YGNodeStyleGetPadding(node, .bottom).value
        }
        set {
            YGNodeStyleSetPadding(node, .bottom, newValue)
        }
    }
    
    open var paddingStart: Float {
        get {
            return YGNodeStyleGetPadding(node, .start).value
        }
        set {
            YGNodeStyleSetPadding(node, .start, newValue)
        }
    }
    
    open var paddingEnd: Float {
        get {
            return YGNodeStyleGetPadding(node, .end).value
        }
        set {
            YGNodeStyleSetPadding(node, .end, newValue)
        }
    }
    
    open var paddingHorizontal: Float {
        get {
            return YGNodeStyleGetPadding(node, .horizontal).value
        }
        set {
            YGNodeStyleSetPadding(node, .horizontal, newValue)
        }
    }
    
    open var paddingVertical: Float {
        get {
            return YGNodeStyleGetPadding(node, .vertical).value
        }
        set {
            YGNodeStyleSetPadding(node, .vertical, newValue)
        }
    }
    
    open var padding: Float {
        get {
            return YGNodeStyleGetPadding(node, .all).value
        }
        set {
            YGNodeStyleSetPadding(node, .all, newValue)
        }
    }
    
    
    open var borderLeftWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .left)
        }
        set {
            return YGNodeStyleSetBorder(node, .left, newValue)
        }
    }
    
    open var borderTopWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .top)
        }
        set {
            return YGNodeStyleSetBorder(node, .top, newValue)
        }
    }
    
    open var borderRightWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .right)
        }
        set {
            return YGNodeStyleSetBorder(node, .right, newValue)
        }
    }
    
    open var borderBottomWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .bottom)
        }
        set {
            return YGNodeStyleSetBorder(node, .bottom, newValue)
        }
    }
    
    open var borderStartWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .start)
        }
        set {
            return YGNodeStyleSetBorder(node, .start, newValue)
        }
    }
    
    open var borderEndWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .end)
        }
        set {
            return YGNodeStyleSetBorder(node, .end, newValue)
        }
    }
    
    open var borderWidth: Float {
        get {
            return YGNodeStyleGetBorder(node, .all)
        }
        set {
            return YGNodeStyleSetBorder(node, .all, newValue)
        }
    }
    
    open var width: Float {
        get {
            return YGNodeStyleGetWidth(node).value
        }
        set {
            YGNodeStyleSetWidth(node, newValue)
        }
    }
    
    open var height: Float {
        get {
            return YGNodeStyleGetHeight(node).value
        }
        set {
            YGNodeStyleSetHeight(node, newValue)
        }
    }
    
    open var minWidth: Float {
        get {
            return YGNodeStyleGetMinWidth(node).value
        }
        set {
            YGNodeStyleSetMinWidth(node, newValue)
        }
    }
    
    open var minHeight: Float {
        get {
            return YGNodeStyleGetMinHeight(node).value
        }
        set {
            YGNodeStyleSetMinHeight(node, newValue)
        }
    }
    
    open var maxWidth: Float {
        get {
            return YGNodeStyleGetMaxWidth(node).value
        }
        set {
            YGNodeStyleSetMaxWidth(node, newValue)
        }
    }
    
    open var maxHeight: Float {
        get {
            return YGNodeStyleGetMaxHeight(node).value
        }
        set {
            YGNodeStyleSetMaxHeight(node, newValue)
        }
    }
    
    
    // Yoga specific properties, not compatible with flexbox specification
    open var aspectRatio: Float {
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
    open var resolvedDirection: YGDirection {
        return YGNodeLayoutGetDirection(node)
    }
    
}
