//
//  AnimationPrinciples.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/21.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import Foundation

struct AnimationPrinciples {
    
    struct Timing {
        static let easing = "Easing"
        static let OffsetAndDelay = "Offset & Delay"
    }
    
    struct ObjectRelationship {
        static let parenting = "Parenting"
    }
    
    struct ObjectContinuity {
        static let transformation = "Transformation"
        static let valueChange = "Value Change"
        static let masking = "Masking"
        static let overlay = "Overlay"
        static let cloning = "Cloning"
    }
    
    struct TemporalHierarchy {
        static let parallax = "Parallax"
    }
    
    struct SpatialContinuity {
        static let obscuration = "Obscuration"
        static let dimensionality = "Dimensionality"
        static let dollyAndZoom = "Dolly & Zoom"
    }

    static var animations: [Animation] {
        let easing = Animation(name: Timing.easing)
        let OffsetAndDelay = Animation(name: Timing.OffsetAndDelay)
        let parenting = Animation(name: ObjectRelationship.parenting)
        let transformation = Animation(name: ObjectContinuity.transformation)
        let valueChange = Animation(name: ObjectContinuity.valueChange)
        let masking = Animation(name: ObjectContinuity.masking)
        let overlay = Animation(name: ObjectContinuity.overlay)
        let cloning = Animation(name: ObjectContinuity.cloning)
        let parallax = Animation(name: TemporalHierarchy.parallax)
        let obscuration = Animation(name: SpatialContinuity.obscuration)
        let dimensionality = Animation(name: SpatialContinuity.dimensionality)
        let dollyAndZoom = Animation(name: SpatialContinuity.dollyAndZoom)

        return [easing, OffsetAndDelay, parenting, transformation, valueChange, masking, overlay, cloning, parallax, obscuration, dimensionality, dollyAndZoom]
    }
}
