//
//  CloningAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/3/5.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class CloningAction: Action {
    
    let parent: UIViewController
    let layer1 = CAShapeLayer()
    let layer2 = CAShapeLayer()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure()

        position()
        
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(layers: [layer1, layer2])
        completion?(true)
    }
    
    private func configure() {
        let path = UIBezierPath()
        let leftCenter = CGPoint(x: fullSize.width * 0.35, y: fullSize.height * 0.5)
        path.addArc(withCenter: leftCenter, radius: 50, startAngle: CGFloat(0).toRadians(), endAngle: CGFloat(360).toRadians(), clockwise: true)
        layer1.path = path.cgPath
        layer1.fillColor = UIColor.lightGray.cgColor
        parent.view.layer.addSublayer(layer1)

        let path2 = UIBezierPath()
        let rightCenter = CGPoint(x: fullSize.width * 0.65, y: fullSize.height * 0.5)
        path2.addArc(withCenter: rightCenter, radius: 50, startAngle: CGFloat(0).toRadians(), endAngle: CGFloat(360).toRadians(), clockwise: true)
        layer2.path = path2.cgPath
        layer2.fillColor = UIColor.lightGray.cgColor
        parent.view.layer.addSublayer(layer2)
    }
    
    private func position() {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "path")
            let path = UIBezierPath()
            let center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
            path.addArc(withCenter: center, radius: 50, startAngle: CGFloat(0).toRadians(), endAngle: CGFloat(360).toRadians(), clockwise: true)
            anim.toValue = path.cgPath
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        layer1.add(anim, forKey: "position\(layer1)")
        layer2.add(anim, forKey: "position\(layer2)")
    }
}

