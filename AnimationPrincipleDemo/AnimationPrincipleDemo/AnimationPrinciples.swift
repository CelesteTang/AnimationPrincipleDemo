//
//  AnimationPrinciples.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/21.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import Foundation

struct AnimationPrinciples {

    static var animations: [Animation] {
        let easing         = Animation(type: Timing.easing)
        let OffsetAndDelay = Animation(type: Timing.offsetAndDelay)
        let parenting      = Animation(type: ObjectRelationship.parenting)
        let transformation = Animation(type: ObjectContinuity.transformation)
        let valueChange    = Animation(type: ObjectContinuity.valueChange)
        let masking        = Animation(type: ObjectContinuity.masking)
        let overlay        = Animation(type: ObjectContinuity.overlay)
        let cloning        = Animation(type: ObjectContinuity.cloning)
        let parallax       = Animation(type: TemporalHierarchy.parallax)
        let obscuration    = Animation(type: SpatialContinuity.obscuration)
        let dimensionality = Animation(type: SpatialContinuity.dimensionality)
        let dollyAndZoom   = Animation(type: SpatialContinuity.dollyAndZoom)

        return [easing, OffsetAndDelay, parenting, transformation, valueChange, masking, overlay, cloning, parallax, obscuration, dimensionality, dollyAndZoom]
    }
}
