//
//  ObscurationAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/3/6.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class ObscurationAction: Action {
    
    let parent: UIViewController
    let view1 = UIView()
    let view2 = UIView()
    let fullSize = UIScreen.main.bounds
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure(view: view1, width: 150, height: 200, color: .gray)
        configure(view: view2, width: 180, height: 240, color: .clear)
        
        position(view: view2)
        blur(view: view2)
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(views: [view1, view2])
        completion?(true)
    }
    
    private func configure(view: UIView, width: CGFloat, height: CGFloat, color: UIColor) {
        view.frame.size = CGSize(width: width, height: height)
        view.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        view.backgroundColor = color
        parent.view.addSubview(view)
    }
    
    private func position(view: UIView) {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "position.x")
            anim.fromValue = view.center.x + 100
            anim.toValue = view.center.x - 100
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        view.layer.add(anim, forKey: "position\(view)")
    }
    
    private func blur(view: UIView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
    }
}
