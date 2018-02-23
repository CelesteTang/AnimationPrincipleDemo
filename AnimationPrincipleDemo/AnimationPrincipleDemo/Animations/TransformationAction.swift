//
//  TransformationAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/23.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class TransformationAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure(view: view1)
        
        bounds(view: view1)
        cornerRadius(view: view1)
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1])
        completion?(true)
    }
    
    private func configure(view: UIView) {
        view.frame.size = CGSize(width: 50, height: 50)
        view.layer.cornerRadius = 25
        view.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view.backgroundColor = .lightGray
        parent.view.addSubview(view)
    }
    
    private func bounds(view: UIView) {
        
        let positionAnim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "bounds.size")
            anim.fromValue = CGSize(width: 50, height: 50)
            anim.toValue = CGSize(width: 200, height: 100)
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view.layer.add(positionAnim, forKey: "bounds\(view)")
    }
    
    private func cornerRadius(view: UIView) {
        
        let positionAnim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "cornerRadius")
            anim.fromValue = 25
            anim.toValue = 0
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view.layer.add(positionAnim, forKey: "cornerRadius\(view)")
    }
}
