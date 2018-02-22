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
    
    lazy var action: Action = {
        let action = ActionFactory().createAction(of: name)
        return action!
    }()
    
    init(name: String) {
        self.name = name
    }
    
    func start() {
        state = .active
        action.start()
    }
    
    func pause() {
        action.pause()
    }
    
    func resume() {
        action.resume()
    }
    
    func stop() {
        state = .stopped
        action.stop { [weak self] stopped in
            if stopped {
                self?.state = .inactive
            }
        }
    }
}
