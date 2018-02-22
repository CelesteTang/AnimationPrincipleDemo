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

class ActionFactory {
    
    func createAction(of name: String) -> Action? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let viewController = appDelegate.window?.rootViewController else {
            print("--Error: ViewController is nil")
            return nil
        }

        switch name {
        case AnimationPrinciples.Timing.easing: return EasingAction(parent: viewController)
        default: return EasingAction(parent: viewController)
        }
    }
    
}
