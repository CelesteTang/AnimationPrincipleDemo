//
//  ParallaxAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/3/6.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class ParallaxAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let view2 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure(view: view1, width: 200, color: .gray)
        configure(view: view2, width: 150, color: .lightGray)

        position(view: view1, y: 10)
        position(view: view2, y: 30)
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1, view2])
        completion?(true)
    }
    
    private func configure(view: UIView, width: CGFloat, color: UIColor) {
        view.frame.size = CGSize(width: width, height: 100)
        view.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view.backgroundColor = color
        parent.view.addSubview(view)
    }
    
    private func position(view: UIView, y: CGFloat) {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "position.y")
            anim.fromValue = view.center.y + y
            anim.toValue = view.center.y - y
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view.layer.add(anim, forKey: "position\(view)")
    }
}

