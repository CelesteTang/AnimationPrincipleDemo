//
//  ViewController.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/21.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationName: UILabel!
    @IBOutlet weak var animationPickerView: UIPickerView!
    
    var pickedAnimation: Animation = Animation(name: AnimationPrinciples.Timing.easing)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickedAnimation.start()
        animationPickerView.dataSource = self
        animationPickerView.delegate = self
        
    }
    
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AnimationPrinciples.animations.count
    }
    
    
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AnimationPrinciples.animations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedAnimation.stop()
        
        pickedAnimation = AnimationPrinciples.animations[row]
        animationName.text = pickedAnimation.name
        
        if pickedAnimation.state == .inactive {
            pickedAnimation.start()
        }
    }
}
