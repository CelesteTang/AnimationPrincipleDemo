//
//  ParentingAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/22.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class ParentingAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let view2 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure(view: view1, y: 0.45)
        configure(view: view2, y: 0.5)

        transform(view: view1)
        position(view: view1)
        position(view: view2)
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1, view2])
        completion?(true)
    }
    
    private func configure(view: UIView, y: CGFloat) {
        view.frame.size = CGSize(width: 100, height: 50)
        view.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * y)
        view.backgroundColor = .lightGray
        parent.view.addSubview(view)
    }
    
    private func position(view: UIView) {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "position.x")
            anim.fromValue = view.center.x + 100
            anim.toValue = view.center.x - 100
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view.layer.add(anim, forKey: "position\(view)")
    }
    
    private func transform(view: UIView) {
        
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "transform.scale")
            anim.fromValue = 1
            anim.toValue = 0.1
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view.layer.add(anim, forKey: "transform\(view)")
    }
}
