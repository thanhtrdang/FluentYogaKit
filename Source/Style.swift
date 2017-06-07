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
    
    public var flexBasis: Float {
        get {
            return YGNodeStyleGetFlexBasis(node).value
        }
        set {
            YGNodeStyleSetFlexBasis(node, newValue)
        }
    }
    
    
    public var left: Float {
        get {
            return YGNodeStyleGetPosition(node, .left).value
        }
        set {
            YGNodeStyleSetPosition(node, .left, newValue)
        }
    }
    
    public var top: Float {
        get {
            return YGNodeStyleGetPosition(node, .top).value
        }
        set {
            YGNodeStyleSetPosition(node, .top, newValue)
        }
    }
    
    public var right: Float {
        get {
            return YGNodeStyleGetPosition(node, .right).value
        }
        set {
            YGNodeStyleSetPosition(node, .right, newValue)
        }
    }
    
    public var bottom: Float {
        get {
            return YGNodeStyleGetPosition(node, .bottom).value
        }
        set {
            YGNodeStyleSetPosition(node, .bottom, newValue)
        }
    }
    
    public var start: Float {
        get {
            return YGNodeStyleGetPosition(node, .start).value
        }
        set {
            YGNodeStyleSetPosition(node, .start, newValue)
        }
    }
    
    public var end: Float {
        get {
            return YGNodeStyleGetPosition(node, .end).value
        }
        set {
            YGNodeStyleSetPosition(node, .end, newValue)
        }
    }
    
    
    public var marginLeft: Float {
        get {
            return YGNodeStyleGetMargin(node, .left).value
        }
        set {
            YGNodeStyleSetMargin(node, .left, newValue)
        }
    }
    
    public var marginTop: Float {
        get {
            return YGNodeStyleGetMargin(node, .top).value
        }
        set {
            YGNodeStyleSetMargin(node, .top, newValue)
        }
    }
    
    public var marginRight: Float {
        get {
            return YGNodeStyleGetMargin(node, .right).value
        }
        set {
            YGNodeStyleSetMargin(node, .right, newValue)
        }
    }
    
    public var marginBottom: Float {
        get {
            return YGNodeStyleGetMargin(node, .bottom).value
        }
        set {
            YGNodeStyleSetMargin(node, .bottom, newValue)
        }
    }
    
    public var marginStart: Float {
        get {
            return YGNodeStyleGetMargin(node, .start).value
        }
        set {
            YGNodeStyleSetMargin(node, .start, newValue)
        }
    }
    
    public var marginEnd: Float {
        get {
            return YGNodeStyleGetMargin(node, .end).value
        }
        set {
            YGNodeStyleSetMargin(node, .end, newValue)
        }
    }
    
    public var marginHorizontal: Float {
        get {
            return YGNodeStyleGetMargin(node, .horizontal).value
        }
        set {
            YGNodeStyleSetMargin(node, .horizontal, newValue)
        }
    }
    
    public var marginVertical: Float {
        get {
            return YGNodeStyleGetMargin(node, .vertical).value
        }
        set {
            YGNodeStyleSetMargin(node, .vertical, newValue)
        }
    }
    
    public var margin: Float {
        get {
            return YGNodeStyleGetMargin(node, .all).value
        }
        set {
            YGNodeStyleSetMargin(node, .all, newValue)
        }
    }
    
    
    public var paddingLeft: Float {
        get {
            return YGNodeStyleGetPadding(node, .left).value
        }
        set {
            YGNodeStyleSetPadding(node, .left, newValue)
        }
    }
    
    public var paddingTop: Float {
        get {
            return YGNodeStyleGetPadding(node, .top).value
        }
        set {
            YGNodeStyleSetPadding(node, .top, newValue)
        }
    }
    
    public var paddingRight: Float {
        get {
            return YGNodeStyleGetPadding(node, .right).value
        }
        set {
            YGNodeStyleSetPadding(node, .right, newValue)
        }
    }
    
    public var paddingBottom: Float {
        get {
            return YGNodeStyleGetPadding(node, .bottom).value
        }
        set {
            YGNodeStyleSetPadding(node, .bottom, newValue)
        }
    }
    
    public var paddingStart: Float {
        get {
            return YGNodeStyleGetPadding(node, .start).value
        }
        set {
            YGNodeStyleSetPadding(node, .start, newValue)
        }
    }
    
    public var paddingEnd: Float {
        get {
            return YGNodeStyleGetPadding(node, .end).value
        }
        set {
            YGNodeStyleSetPadding(node, .end, newValue)
        }
    }
    
    public var paddingHorizontal: Float {
        get {
            return YGNodeStyleGetPadding(node, .horizontal).value
        }
        set {
            YGNodeStyleSetPadding(node, .horizontal, newValue)
        }
    }
    
    public var paddingVertical: Float {
        get {
            return YGNodeStyleGetPadding(node, .vertical).value
        }
        set {
            YGNodeStyleSetPadding(node, .vertical, newValue)
        }
    }
    
    public var padding: Float {
        get {
            return YGNodeStyleGetPadding(node, .all).value
        }
        set {
            YGNodeStyleSetPadding(node, .all, newValue)
        }
    }
    
    
    public var borderLeft: Float {
        get {
            return YGNodeStyleGetBorder(node, .left)
        }
        set {
            return YGNodeStyleSetBorder(node, .left, newValue)
        }
    }
    
    public var borderTop: Float {
        get {
            return YGNodeStyleGetBorder(node, .top)
        }
        set {
            return YGNodeStyleSetBorder(node, .top, newValue)
        }
    }
    
    public var borderRight: Float {
        get {
            return YGNodeStyleGetBorder(node, .right)
        }
        set {
            return YGNodeStyleSetBorder(node, .right, newValue)
        }
    }
    
    public var borderBottom: Float {
        get {
            return YGNodeStyleGetBorder(node, .bottom)
        }
        set {
            return YGNodeStyleSetBorder(node, .bottom, newValue)
        }
    }
    
    public var borderStart: Float {
        get {
            return YGNodeStyleGetBorder(node, .start)
        }
        set {
            return YGNodeStyleSetBorder(node, .start, newValue)
        }
    }
    
    public var borderEnd: Float {
        get {
            return YGNodeStyleGetBorder(node, .end)
        }
        set {
            return YGNodeStyleSetBorder(node, .end, newValue)
        }
    }

    public var borderVertical: Float {
        get {
            return YGNodeStyleGetBorder(node, .vertical)
        }
        set {
            return YGNodeStyleSetBorder(node, .vertical, newValue)
        }
    }

    public var borderHorizontal: Float {
        get {
            return YGNodeStyleGetBorder(node, .horizontal)
        }
        set {
            return YGNodeStyleSetBorder(node, .horizontal, newValue)
        }
    }

    public var border: Float {
        get {
            return YGNodeStyleGetBorder(node, .all)
        }
        set {
            return YGNodeStyleSetBorder(node, .all, newValue)
        }
    }
    
    public var width: Float {
        get {
            return YGNodeStyleGetWidth(node).value
        }
        set {
            YGNodeStyleSetWidth(node, newValue)
        }
    }
    
    public var height: Float {
        get {
            return YGNodeStyleGetHeight(node).value
        }
        set {
            YGNodeStyleSetHeight(node, newValue)
        }
    }
    
    public var minWidth: Float {
        get {
            return YGNodeStyleGetMinWidth(node).value
        }
        set {
            YGNodeStyleSetMinWidth(node, newValue)
        }
    }
    
    public var minHeight: Float {
        get {
            return YGNodeStyleGetMinHeight(node).value
        }
        set {
            YGNodeStyleSetMinHeight(node, newValue)
        }
    }
    
    public var maxWidth: Float {
        get {
            return YGNodeStyleGetMaxWidth(node).value
        }
        set {
            YGNodeStyleSetMaxWidth(node, newValue)
        }
    }
    
    public var maxHeight: Float {
        get {
            return YGNodeStyleGetMaxHeight(node).value
        }
        set {
            YGNodeStyleSetMaxHeight(node, newValue)
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
