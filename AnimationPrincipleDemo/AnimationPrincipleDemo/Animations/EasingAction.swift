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
        view1.frame.size = CGSize(width: 100, height: 100)
        view1.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view1.backgroundColor = .lightGray
        parent.view.addSubview(view1)
        
        let positionAnim1 = CAKeyframeAnimation(keyPath: "position")
        let p1 = CGPoint(x: view1.center.x - 250, y: fullSize.height * 0.5)
        let p2 = CGPoint(x: view1.center.x, y: fullSize.height * 0.5)
        let p3 = CGPoint(x: view1.center.x + 250, y: fullSize.height * 0.5)
        positionAnim1.values = [p1, p2, p2, p3]
        positionAnim1.keyTimes = [0, 0.5, 0.7, 1]
        positionAnim1.timingFunctions = [
            CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        positionAnim1.duration = 3
        positionAnim1.speed = 1.5
        positionAnim1.repeatCount = .infinity
        view1.layer.add(positionAnim1, forKey: "Animation")
    }
    
    func pause() {
        let pausedTime = view1.layer.convertTime(CACurrentMediaTime(), from: nil)
        view1.layer.speed = 0.0
        view1.layer.timeOffset = pausedTime
    }
    
    func resume() {
        let pausedTime = view1.layer.timeOffset
        view1.layer.speed = 1.0
        view1.layer.timeOffset = 0.0
        view1.layer.beginTime = 0.0
        let timeSincePause = view1.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        view1.layer.beginTime = timeSincePause
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        view1.layer.removeAllAnimations()
        view1.removeFromSuperview()
        completion?(true)
    }
}
