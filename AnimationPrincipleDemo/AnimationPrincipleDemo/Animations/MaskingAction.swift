//
//  MaskingAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/23.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class MaskingAction: Action {
    
    let parent: UIViewController
    var layer = CAShapeLayer()
    let view1 = UIView()
    let view2 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure()
        
        path()
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(layers: [view1.layer, view2.layer, layer])
        completion?(true)
    }
    
    private func configure() {
        
        view1.frame.size = CGSize(width: 200, height: 100)
        view1.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view1.backgroundColor = .gray
        parent.view.addSubview(view1)
        
        view2.frame.size = CGSize(width: 200, height: 100)
        view2.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view2.backgroundColor = .lightGray
        parent.view.addSubview(view2)
        
        layer = circleShapeLayer()
        view2.layer.addSublayer(layer)
        view2.layer.mask = layer
    }
    
    private func circleShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let bezierPath = self.bezierPath(withLeftCenter: CGPoint(x: 100, y: 50), rightCenter: CGPoint(x: 100, y: 50), radius: 20)
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.darkGray.cgColor
        return shapeLayer
    }
    
    private func path() {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "path")
            let bezierPath = self.bezierPath(withLeftCenter: CGPoint(x: 0, y: 50), rightCenter: CGPoint(x: 200, y: 50), radius: 70)
            anim.toValue = bezierPath.cgPath
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        layer.add(anim, forKey: "path\(view2)")
    }
    
    private func bezierPath(withLeftCenter leftCenter: CGPoint, rightCenter: CGPoint, radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        path.addArc(withCenter: leftCenter, radius: radius, startAngle: CGFloat(90).toRadians(), endAngle: CGFloat(270).toRadians(), clockwise: true)
        path.addArc(withCenter: rightCenter, radius: radius, startAngle: CGFloat(-90).toRadians(), endAngle: CGFloat(90).toRadians(), clockwise: true)
        path.close()
        return path
    }
}
