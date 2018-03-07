//
//  DimensionalityAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/3/6.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class DimensionalityAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure()
        
        flip()
        
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1])
        completion?(true)
    }
    
    private func configure() {
        view1.frame.size = CGSize(width: 200, height: 50)
        view1.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view1.backgroundColor = .lightGray
        view1.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        parent.view.addSubview(view1)
        
        let view2 = UIView()
        view2.frame.size = CGSize(width: 200, height: 50)
        view2.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5 - 25)
        view2.backgroundColor = .white
        parent.view.addSubview(view2)
    }
    
    private func flip() {

        let anim: CABasicAnimation = {

            let anim = CABasicAnimation(keyPath: "transform")
            var transform = CATransform3DIdentity
            let angle = CGFloat(-90)
            transform.m34  = -1 / 500
            anim.toValue = CATransform3DRotate(transform, angle, 1, 0, 0)

            return anim
        }()

        let anim2: CABasicAnimation = {

            let anim = CABasicAnimation(keyPath: "backgroundColor")
            anim.fromValue = UIColor.lightGray.cgColor
            anim.toValue = UIColor.darkGray.cgColor

            return anim
        }()
        
        let group: CAAnimationGroup = {
            let group = CAAnimationGroup()
            group.animations = [anim, anim2]
            group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            group.duration = 2
            group.speed = 2
            group.autoreverses = true
            group.repeatCount = .infinity
            return group
        }()
        
        
        view1.layer.add(group, forKey: "group\(view1)")
    }

}

