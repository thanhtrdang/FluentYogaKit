//
//  YogaKit.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/28/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import ObjectiveC
import yoga

// MARK: YGLayout -
public struct YGDimensionFlexibility : OptionSet {
    public let rawValue: Int
    
    public static let flexibleWidth = YGDimensionFlexibility(rawValue: 1 << 0)
    public static let flexibleHeigth = YGDimensionFlexibility(rawValue: 1 << 1)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

open class YGLayout: NSObject {
    fileprivate static let globalConfig: YGConfigRef? = {
        let config = YGConfigNew()
        YGConfigSetExperimentalFeatureEnabled(config, .webFlexBasis, true)
        YGConfigSetPointScaleFactor(config, Float(UIScreen.main.scale))
        
        return config
    }()

    fileprivate init(view: UIView) {
        self.view = view
        node = YGNodeNewWithConfig(YGLayout.globalConfig)
        
        YGNodeViewContext[node] = view
        
//TODO: Review later YGNodeSetContext(node, &self.view)
    }

    deinit {
        YGNodeViewContext.removeValue(forKey: node)
        YGNodeFree(node)
    }
    
    fileprivate unowned var view: UIView
    fileprivate let node: YGNodeRef
    
    /**
     The property that decides if we should include this view when calculating layout. Defaults to YES.
     */
    open var isIncludedInLayout: Bool = true

    /**
     The property that decides during layout/sizing whether or not styling properties should be applied.
     Defaults to NO.
     */
    open var isEnabled: Bool = false
    
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
    
    /**
     Perform a layout calculation and update the frames of the views in the hierarchy with the results.
     If the origin is not preserved, the root view's layout results will applied from {0,0}.
     */
    open func applyLayout(preservingOrigin preserveOrigin: Bool = false, dimensionFlexibility: YGDimensionFlexibility = []) {
        var size = view.bounds.size
        
        if dimensionFlexibility.contains(.flexibleWidth) {
            size.width = CGFloat(YGValueUndefined.value)
        }
        if dimensionFlexibility.contains(.flexibleHeigth) {
            size.height = CGFloat(YGValueUndefined.value)
        }

        calculateLayout(size: size.ygSize)
        YGApplyLayoutToViewHierarchy(view: view, preserveOrigin: preserveOrigin)
    }
    
    /**
     Returns the size of the view if no constraints were given. This could equivalent to calling 
     self.sizeThatFits(CGSize(width: CGFLOAT_MAX, height: CGFLOAT_MAX))
     */
    open var intrinsicSize: CGSize {
        return calculateLayout(size: YGSize.undefined).cgSize
    }
    
    @discardableResult
    fileprivate func calculateLayout(size: YGSize) -> YGSize {
        assert(Thread.isMainThread, "Yoga calculation must be done on main.")
        assert(isEnabled, "Yoga is not enabled for this view.")

        YGAttachNodesFromViewHierachy(view: view)
        YGNodeCalculateLayout(node, size.width, size.height, YGNodeStyleGetDirection(node))
        
        return YGSize(width: YGNodeLayoutGetWidth(node), height: YGNodeLayoutGetHeight(node))
    }
    
    /**
     Returns the number of children that are using Flexbox.
     */
    open var numberOfChildren: UInt {
        return UInt(YGNodeGetChildCount(node))
    }
    
    /**
     Return a BOOL indiciating whether or not we this node contains any subviews that are included in
     Yoga's layout.
     */
    open var isLeaf: Bool {
        assert(Thread.isMainThread, "This method must be called on the main thread.")
        
        if isEnabled {
            let anyIncludedSubview = view.subviews.first { subview -> Bool in
                let yoga = subview.yoga
                return yoga.isEnabled && yoga.isIncludedInLayout
            }
            
            return anyIncludedSubview == nil
        }
        
        return true
    }
    /**
     Return's a BOOL indicating if a view is dirty. When a node is dirty
     it usually indicates that it will be remeasured on the next layout pass.
     */
    open var isDirty: Bool {
        return YGNodeIsDirty(node)
    }

    
    /**
     Mark that a view's layout needs to be recalculated. Only works for leaf views.
     */
    open func markDirty() {
        if isDirty || !isLeaf {
            return
        }
        
        // Yoga is not happy if we try to mark a node as "dirty" before we have set
        // the measure function. Since we already know that this is a leaf,
        // this *should* be fine. Forgive me Hack Gods.
        if YGNodeGetMeasureFunc(node) == nil {
            YGNodeSetMeasureFunc(node, YGNodeMeasureFunc)
        }
        
        YGNodeMarkDirty(node)
    }
}

// MARK: - UIView -
public typealias YGLayoutConfigurationBlock = (YGLayout) -> Void

extension UIView {
    private struct AssociatedKey {
        static var yoga_flexbox = "yoga_flexbox"
    }
    
    /**
     The YGLayout that is attached to this view. It is lazily created.
     */
    open var yoga: YGLayout {
        var yogaLayout = objc_getAssociatedObject(self, &AssociatedKey.yoga_flexbox) as? YGLayout
        if (yogaLayout == nil) {
            yogaLayout = YGLayout(view: self)
            objc_setAssociatedObject(self, &AssociatedKey.yoga_flexbox, yogaLayout, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        return yogaLayout!
    }
    
    /**
     In ObjC land, every time you access `view.yoga.*` you are adding another `objc_msgSend`
     to your code. If you plan on making multiple changes to YGLayout, it's more performant
     to use this method, which uses a single objc_msgSend call.
     */
    open func configureLayout(block: @escaping YGLayoutConfigurationBlock) {
        block(yoga)
    }
}

// MARK: - YGNode -
fileprivate var YGNodeViewContext: [YGNodeRef: UIView] = [:]

fileprivate let YGNodeMeasureFunc: YGMeasureFunc = { (node: YGNodeRef?, width: Float, widthMode: YGMeasureMode, height: Float, heightMode: YGMeasureMode) -> YGSize in
    let constrainedWidth = (widthMode == .undefined) ? YGValueUndefined.value : width
    let constrainedHeight = (heightMode == .undefined) ? YGValueUndefined.value : height
    let constrainedSize = YGSize(width: constrainedWidth, height: constrainedHeight)
    
//TODO: Review later let view = YGNodeGetContext(node).load(as: UIView.self)
    
    let view = YGNodeViewContext[node!]!
    let sizeThatFits = view.sizeThatFits(constrainedSize.cgSize)
    
    return YGSize(
        width: YGNodeSanitizeMeasurement(constrainedSize: constrainedWidth, measuredSize: Float(sizeThatFits.width), measureMode: widthMode),
        height: YGNodeSanitizeMeasurement(constrainedSize: constrainedHeight, measuredSize: Float(sizeThatFits.height), measureMode: heightMode)
    )
}

fileprivate func YGNodeSanitizeMeasurement(constrainedSize: Float, measuredSize: Float, measureMode: YGMeasureMode) -> Float {
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

fileprivate func YGNodeHasExactSameChildren(node: YGNodeRef, included subviews: [UIView]) -> Bool {
    var result = true
    
    if YGNodeGetChildCount(node) != UInt32(subviews.count) {
        result = false
    } else {
        for (index, subview) in subviews.enumerated() {
            if YGNodeGetChild(node, UInt32(index)) != subview.yoga.node {
                result = false
                break
            }
        }
    }
    
    return result
}

fileprivate func YGNodeRemoveAllChildren(from node: YGNodeRef) {
    var childCount = YGNodeGetChildCount(node)
    while childCount > 0 {
        YGNodeRemoveChild(node, YGNodeGetChild(node, childCount - 1))
        childCount = YGNodeGetChildCount(node)
    }
}

fileprivate func YGAttachNodesFromViewHierachy(view: UIView) {
    let yoga = view.yoga
    let node = yoga.node
    
    if yoga.isLeaf {
        YGNodeRemoveAllChildren(from: node)
        YGNodeSetMeasureFunc(node, YGNodeMeasureFunc)
    } else {
        YGNodeSetMeasureFunc(node, nil)
        let includedSubviews = view.subviews.filter { $0.yoga.isIncludedInLayout }
        if !YGNodeHasExactSameChildren(node: node, included: includedSubviews) {
            YGNodeRemoveAllChildren(from: node)
            for (index, includedSubview) in includedSubviews.enumerated() {
                YGNodeInsertChild(node, includedSubview.yoga.node, UInt32(index))
            }
        }
        includedSubviews.forEach { YGAttachNodesFromViewHierachy(view: $0) }
    }
}

fileprivate func YGApplyLayoutToViewHierarchy(view: UIView, preserveOrigin: Bool) {
    assert(Thread.isMainThread, "Framesetting should only be done on the main thread.")
    
    let yoga = view.yoga
    guard yoga.isIncludedInLayout else {
        return
    }
    
    let node = yoga.node
    let topLeft = CGPoint(x: CGFloat(YGNodeLayoutGetLeft(node)), y: CGFloat(YGNodeLayoutGetTop(node)))
    let bottomRight = CGPoint(x: topLeft.x + CGFloat(YGNodeLayoutGetWidth(node)), y: topLeft.y + CGFloat(YGNodeLayoutGetHeight(node)))
    let origin = preserveOrigin ? view.frame.origin : .zero
    
    view.frame = CGRect(
        origin: CGPoint(x: (topLeft.x + origin.x).roundPixel, y: (topLeft.y + origin.y).roundPixel),
        size: CGSize(width: (bottomRight.x - topLeft.x).roundPixel, height: (bottomRight.y - topLeft.y).roundPixel)
    )
    
    if !yoga.isLeaf {
        view.subviews.forEach { subview in
            YGApplyLayoutToViewHierarchy(view: subview, preserveOrigin: false)
        }
    }
}


// MARK: - Helpers -
extension CGFloat {
    fileprivate var roundPixel: CGFloat {
        let scale = UIScreen.main.scale
        return Darwin.round(self * scale) / scale
    }
    
    fileprivate var float: Float {
        return Float(self)
    }
}

extension CGSize {
    fileprivate var ygSize: YGSize {
        return YGSize(width: Float(width), height: Float(height))
    }
}

extension YGSize {
    fileprivate static let undefined = YGSize(width: YGValueUndefined.value, height: YGValueUndefined.value)
    
    fileprivate var cgSize: CGSize {
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}

// MARK: - Percentage -
postfix operator %

extension Int {
    public static postfix func %(value: Int) -> YGValue {
        return YGValue(value: Float(value), unit: .percent)
    }
}

extension Float {
    public static postfix func %(value: Float) -> YGValue {
        return YGValue(value: value, unit: .percent)
    }
}

extension CGFloat {
    public static postfix func %(value: CGFloat) -> YGValue {
        return YGValue(value: Float(value), unit: .percent)
    }
}

extension YGValue : ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public init(integerLiteral value: Int) {
        self = YGValue(value: Float(value), unit: .point)
    }
    
    public init(floatLiteral value: Float) {
        self = YGValue(value: value, unit: .point)
    }
    
    public init(_ value: Float) {
        self = YGValue(value: value, unit: .point)
    }
    
    public init(_ value: CGFloat) {
        self = YGValue(value: Float(value), unit: .point)
    }
}
