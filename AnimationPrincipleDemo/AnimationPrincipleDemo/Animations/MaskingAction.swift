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
    let view = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure()
        
        path()
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(layers: [view.layer, layer])
        completion?(true)
    }
    
    private func configure() {

        view.frame.size = CGSize(width: 200, height: 100)
        view.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view.backgroundColor = .lightGray
        parent.view.addSubview(view)
        
        layer = circleShapeLayer()
        view.layer.addSublayer(layer)
        view.layer.mask = layer
    }
    
    private func circleShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100, y: 50),
                                      radius: 40,
                                      startAngle: 0,
                                      endAngle: 2 * CGFloat.pi,
                                      clockwise: true)
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.darkGray.cgColor
        return shapeLayer
    }
    
    private func path() {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "path")
            anim.toValue = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 200, height: 100)).cgPath
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity

            return anim
        }()
        
        layer.add(anim, forKey: "path\(view)")
    }
}
