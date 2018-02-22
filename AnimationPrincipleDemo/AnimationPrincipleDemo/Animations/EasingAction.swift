//
//  EasingViewController.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/22.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class EasingAction: Action {

    let parent: UIViewController
    let view1 = UIView()
    let fullSize = UIScreen.main.bounds

    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        let middleX = fullSize.width * 0.5
        let middleY = fullSize.height * 0.5
        
        view1.frame.size = CGSize(width: 100, height: 100)
        view1.center = CGPoint(x: middleX, y: middleY)
        view1.backgroundColor = .lightGray
        parent.view.addSubview(view1)
        
        let positionAnim: CAKeyframeAnimation = {
            
            let anim = CAKeyframeAnimation(keyPath: "position")
            
            let p1 = CGPoint(x: view1.center.x - 250, y: middleY)
            let p2 = CGPoint(x: view1.center.x, y: middleY)
            let p3 = CGPoint(x: view1.center.x + 250, y: middleY)
            
            anim.values = [p1, p2, p2, p3]
            anim.keyTimes = [0, 0.5, 0.7, 1]
            anim.timingFunctions = [
                CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault),
                CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault),
                CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
                CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
            anim.duration = 3
            anim.speed = 1.5
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view1.layer.add(positionAnim, forKey: "Animation")
    }

    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1])
        completion?(true)
    }
}
