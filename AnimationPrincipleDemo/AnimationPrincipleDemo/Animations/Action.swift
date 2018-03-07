//
//  Action.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/22.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

protocol Action {
    
    init(parent: UIViewController)
    
    func start()
    
    func pause()
    
    func resume()
    
    func stop(completion: ((Bool) -> Swift.Void)?)

}

extension Action {
    
    func pause() {}
    
    func resume() {}
    
    func pauseAnimate(views: [UIView]) {
        views.forEach {
            let pausedTime = $0.layer.convertTime(CACurrentMediaTime(), from: nil)
            $0.layer.speed = 0.0
            $0.layer.timeOffset = pausedTime
        }
    }
    
    func resumeAnimate(views: [UIView]) {
        views.forEach {
            let pausedTime = $0.layer.timeOffset
            $0.layer.speed = 1.0
            $0.layer.timeOffset = 0.0
            $0.layer.beginTime = 0.0
            let timeSincePause = $0.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            $0.layer.beginTime = timeSincePause
        }
    }
    
    func stopAnimate(views: [UIView]) {
        views.forEach {
            $0.layer.removeAllAnimations()
            $0.removeFromSuperview()
        }
    }
    
    func stopAnimate(layers: [CALayer]) {
        layers.forEach {
            $0.removeAllAnimations()
            $0.removeFromSuperlayer()
        }
    }
}

class ActionFactory {
    
    func createAction(of name: String) -> Action? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let viewController = appDelegate.window?.rootViewController else {
            print("--Error: ViewController is nil")
            return nil
        }

        switch name {
        case AnimationPrinciples.Timing.easing: return EasingAction(parent: viewController)
        case AnimationPrinciples.Timing.offsetAndDelay: return OffsetAndDelayAction(parent: viewController)
        case AnimationPrinciples.ObjectRelationship.parenting: return ParentingAction(parent: viewController)
        case AnimationPrinciples.ObjectContinuity.transformation: return TransformationAction(parent: viewController)
        case AnimationPrinciples.ObjectContinuity.valueChange: return ValueChangeAction(parent: viewController)
        case AnimationPrinciples.ObjectContinuity.masking: return MaskingAction(parent: viewController)
        case AnimationPrinciples.ObjectContinuity.overlay: return OverlayAction(parent: viewController)
        case AnimationPrinciples.ObjectContinuity.cloning: return CloningAction(parent: viewController)
        case AnimationPrinciples.TemporalHierarchy.parallax: return ParallaxAction(parent: viewController)
        case AnimationPrinciples.SpatialContinuity.obscuration: return ObscurationAction(parent: viewController)
        case AnimationPrinciples.SpatialContinuity.dimensionality: return DimensionalityAction(parent: viewController)
        case AnimationPrinciples.SpatialContinuity.dollyAndZoom: return DollyAndZoomAction(parent: viewController)

        default: return EasingAction(parent: viewController)
        }
    }
    
}
