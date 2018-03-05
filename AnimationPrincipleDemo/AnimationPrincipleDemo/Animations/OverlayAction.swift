//
//  OverlayAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/3/5.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class OverlayAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let view2 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure()
        
        position()
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1, view2])
        completion?(true)
    }
    
    private func configure() {
        
        view1.frame.size = CGSize(width: 100, height: 100)
        view1.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view1.backgroundColor = .gray
        parent.view.addSubview(view1)
        
        view2.frame.size = CGSize(width: 100, height: 100)
        view2.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view2.backgroundColor = .lightGray
        parent.view.addSubview(view2)
    }
    
    private func position() {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "position")
            anim.fromValue = CGPoint(x: fullSize.width * 0.7, y: fullSize.height * 0.5)
            anim.toValue = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view2.layer.add(anim, forKey: "path\(view2)")
    }
}

