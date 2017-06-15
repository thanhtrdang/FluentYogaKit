//
//  GestureViewController.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 6/12/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import YetAnotherAnimationLibrary

extension CGPoint {
    var magnitude: CGFloat {
        return hypot(x, y)
    }
}
func + (l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x + r.x, y: l.y + r.y)
}

extension CGFloat {
    func clamp(_ a: CGFloat, b: CGFloat) -> CGFloat {
        return CGFloat.minimum(CGFloat.maximum(self, a), b)
    }
}

class GestureViewController: UIViewController {
    fileprivate let redView = UIView()
    
    fileprivate var beginPosition: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.subview(redView)
        
        view.yoga
            .center(redView.yoga.size(width: 100, height: 100))
            .layout()
        
        redView.layer.cornerRadius = 7
        redView.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(gr:))))
        redView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(pan(gr:))))
        
        redView.layer.yaal.perspective.setTo(-1/500)
        
        let limit = CGFloat.pi / 3
        redView.yaal.center.velocity => { 1 - $0.magnitude / 3000 } => redView.yaal.alpha
        
        // 2d rotation
        redView.yaal.center.velocity => { ($0.x / 1000).clamp(-limit, b: limit) } => redView.yaal.rotation
        
        // 3d rotation
        redView.yaal.center.velocity => { ($0.x / 1000).clamp(-limit, b: limit) } => redView.yaal.rotationY
        redView.yaal.center.velocity => { (-$0.y / 1000).clamp(-limit, b: limit) } => redView.yaal.rotationX
    }
    
    func tap(gr: UITapGestureRecognizer) {
        redView.yaal.center.animateTo(gr.location(in: view))
    }
    
    func pan(gr: UIPanGestureRecognizer) {
        switch gr.state {
        case .began:
            beginPosition = redView.center
            fallthrough
        case .changed:
            redView.yaal.center.setTo(gr.translation(in: view) + beginPosition!)
        default:
            redView.yaal.center.decay(initialVelocity:gr.velocity(in: nil), damping: 5)
        }
    }


}
