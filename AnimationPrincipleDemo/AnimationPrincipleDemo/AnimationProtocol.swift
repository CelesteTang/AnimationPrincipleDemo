//
//  AnimationProtocol.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/21.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import Foundation
/*
protocol AnimationProtocol {
    var name: String { get }
    var action: Action { get }
}

enum Timing: AnimationProtocol {
    
    case easing, offsetAndDelay
    
    var name: String {
        switch self {
        case .easing: return "Easing"
        case .offsetAndDelay: return "Offset & Delay"
        }
    }
    
    lazy var action: Action = {
        switch self {
        case .easing: return EasingAction(parent: ViewController())
        case .offsetAndDelay: return EasingAction(parent: ViewController())
        }
    }()
    
}

enum ObjectRelationship: AnimationProtocol {
    
    case parenting
    
    var name: String {
        switch self {
        case .parenting: return "Parenting"
        }
    }
    
    var action: Action {
        return EasingAction(parent: ViewController())
    }

}

enum ObjectContinuity: AnimationProtocol {
    
    case transformation, valueChange, masking, overlay, cloning
    
    var name: String {
        switch self {
        case .transformation: return "Transformation"
        case .valueChange: return "Value Change"
        case .masking: return "Masking"
        case .overlay: return "Overlay"
        case .cloning: return "Cloning"
        }
    }
    
    var action: Action {
        return EasingAction(parent: ViewController())
    }
}

enum TemporalHierarchy: AnimationProtocol {
    
    case parallax
    
    var name: String {
        switch self {
        case .parallax: return "Parallax"
        }
    }
    
    var action: Action {
        return EasingAction(parent: ViewController())
    }
}

enum SpatialContinuity: AnimationProtocol {
    
    case obscuration, dimensionality, dollyAndZoom
    
    var name: String {
        switch self {
        case .obscuration: return "Obscuration"
        case .dimensionality: return "Dimensionality"
        case .dollyAndZoom: return "Dolly & Zoom"
        }
    }
    
    var action: Action {
        return EasingAction(parent: ViewController())
    }
}
*/
