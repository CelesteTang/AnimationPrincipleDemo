//
//  ValueChangeAction.swift
//  AnimationPrincipleDemo
//
//  Created by 湯芯瑜 on 2018/2/23.
//  Copyright © 2018年 Hsin-Yu Tang. All rights reserved.
//

import UIKit

class ValueChangeAction: NSObject, Action {
    
    let parent: UIViewController
    let fullSize = UIScreen.main.bounds

    var shapeLayer = CAShapeLayer()
    var trackLayer = CAShapeLayer()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Processing"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var downloadTask = URLSessionDownloadTask()
    
    required init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        configure()
        beginDownloadingFile()
//        strokeEnd(shapeLayer: shapeLayer)
    }
    
    func stop(completion: ((Bool) -> Void)?) {
        downloadTask.cancel()
        stopAnimate(layers: [trackLayer, shapeLayer])
        percentageLabel.removeFromSuperview()
        completion?(true)
    }
    
    private func configure() {
        
        parent.view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = parent.view.center
        
        trackLayer = customShapeLayer()
        
        shapeLayer = {
            let shapeLayer = customShapeLayer()
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.lineCap = kCALineCapRound
            shapeLayer.strokeEnd = 0
            return shapeLayer
        }()
        
        parent.view.layer.addSublayer(trackLayer)
        parent.view.layer.addSublayer(shapeLayer)
    }
    
    private func customShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: parent.view.center,
                                      radius: 100,
                                      startAngle: CGFloat(-90).toRadians(),
                                      endAngle: CGFloat(270).toRadians(),
                                      clockwise: true)
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 10
        return shapeLayer
    }
    
    private func strokeEnd(shapeLayer: CAShapeLayer) {
        
        let anim: CABasicAnimation = {
            let anim = CABasicAnimation(keyPath: "strokeEnd")
            anim.toValue = 1
            anim.duration = 2
            anim.fillMode = kCAFillModeForwards
            anim.isRemovedOnCompletion = false
            
            return anim
        }()
        
        shapeLayer.add(anim, forKey: "strokeEnd\(shapeLayer)")
    }

    private func beginDownloadingFile() {

        shapeLayer.strokeEnd = 0

        let urlString = "https://drive.google.com/uc?export=download&id=14TFlwU-6KuQrEx7OgrjNfUyStqI6YQwZ"
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        guard let url = URL(string: urlString) else { return }
        downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
}

extension ValueChangeAction: URLSessionDownloadDelegate {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {

//        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        let percentage = CGFloat(totalBytesWritten) / CGFloat(55180268.0)
        
        DispatchQueue.main.async {
            self.shapeLayer.strokeEnd = percentage
            self.percentageLabel.font = UIFont.boldSystemFont(ofSize: 32)
            self.percentageLabel.text = "\(Int(percentage * 100))%"
        }

//        print(percentage)
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finished downloading file")
    }

}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat.pi / 180.0
    }
}
