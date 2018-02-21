//
//  Animation.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/21.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import Foundation

enum AnimationState {
    case active, stopped, inactive
}

class Animation {
    
    let name: String
    var state: AnimationState = .inactive
    var action: (() -> Void)
    
    init(type: AnimationProtocol) {
        self.name = type.name
        self.action = type.action
    }
    
    func start() {
        state = .active
        action()
    }
    
    func stop() {
        state = .stopped
        // TODO: When completion, state = .inactive
    }
}
