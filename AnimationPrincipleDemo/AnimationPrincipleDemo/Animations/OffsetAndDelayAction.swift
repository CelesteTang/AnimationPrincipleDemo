//
//  OffsetAndDelayAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/22.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import Foundation

import UIKit

class OffsetAndDelayAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {

        configure(view: view1, y: 0.35)
        configure(view: view2, y: 0.45)
        configure(view: view3, y: 0.55)

        animate(view: view1, timing: kCAMediaTimingFunctionDefault, keyTime: 0.7)
        animate(view: view2, timing: kCAMediaTimingFunctionDefault, keyTime: 0.7)
        animate(view: view3, timing: kCAMediaTimingFunctionEaseIn, keyTime: 0.8)
    }

    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1, view2, view3])
        completion?(true)
    }
    
    private func configure(view: UIView, y: CGFloat) {
        view.frame.size = CGSize(width: 150, height: 50)
        view.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * y)
        view.backgroundColor = .lightGray
        parent.view.addSubview(view)
    }
    
    private func animate(view: UIView, timing: String, keyTime: NSNumber) {
        
        let positionAnim: CAKeyframeAnimation = {
            
            let anim = CAKeyframeAnimation(keyPath: "position")
            
            let p1 = CGPoint(x: view.center.x - 250, y: view.center.y)
            let p2 = CGPoint(x: view.center.x,       y: view.center.y)
            let p3 = CGPoint(x: view.center.x + 250, y: view.center.y)
            
            anim.values = [p1, p2, p2, p3]
            anim.keyTimes = [0, 0.5, keyTime, 1]
            anim.timingFunctions = [
                CAMediaTimingFunction(name: timing),
                CAMediaTimingFunction(name: timing),
                CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
                CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
            anim.duration = 3
            anim.speed = 1.5
            anim.repeatCount = .infinity
            
            return anim
        }()

        view.layer.add(positionAnim, forKey: "\(view)")
    }
}
