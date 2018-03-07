//
//  DollyAndZoomAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/3/7.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class DollyAndZoomAction: Action {
    
    let parent: UIViewController
    var layer = CAShapeLayer()
    let fullSize = UIScreen.main.bounds
    var stackView = UIStackView()
    var view: UIView {
        let view = createView()
        return view
    }
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        
        configure()
        
        transform()
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        stopAnimate(layers: [stackView.layer, layer])
        completion?(true)
    }
    
    private func configure() {
        
        let stackView1 = createStackView(of: .horizontal, arrangedSubviews: [view, view, view])
        let stackView2 = createStackView(of: .horizontal, arrangedSubviews: [view, view, view])
        let stackView3 = createStackView(of: .horizontal, arrangedSubviews: [view, view, view])
        
        let subview = UIView(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: fullSize.height))
        parent.view.addSubview(subview)
        
        stackView = createStackView(of: .vertical, arrangedSubviews: [stackView1, stackView2, stackView3])
        subview.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: parent.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: parent.view.centerYAnchor).isActive = true
        
        layer = triangleShapeLayer()
        subview.layer.addSublayer(layer)
        subview.layer.mask = layer
    }
    
    private func triangleShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let rect = CGRect(x: parent.view.center.x - 150, y: parent.view.center.y - 75, width: 300, height: 150)
        let bezierPath = UIBezierPath(rect: rect)
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.darkGray.cgColor
        return shapeLayer
    }
    
    private func transform() {
        
        let anim: CABasicAnimation = {
            
            let anim = CABasicAnimation(keyPath: "transform.scale")
            anim.toValue = 3
            anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            anim.duration = 2
            anim.speed = 2
            anim.autoreverses = true
            anim.repeatCount = .infinity
            
            return anim
        }()
        
        stackView.layer.add(anim, forKey: "transform.scale\(layer)")
    }
    
    private func createStackView(of axis: UILayoutConstraintAxis, arrangedSubviews subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    private func createView() -> UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return view
    }
}
