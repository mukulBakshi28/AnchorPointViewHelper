//
//  ViewController.swift
//  CoreAnimation3DAnimation
//
//  Created by MUKUL on 10/01/19.
//  Copyright © 2019 CoderWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var transformation = CATransform3DIdentity
        transformation.m34 = -0.002
        UIView.animate(withDuration: 4) {
            [unowned self] in
            self.redView.setAnchorPoint(CGPoint(x: 0, y: 0))
            self.redView.layer.transform = CATransform3DRotate(transformation, 90.0 / 180.0 * .pi, 0, 1, 0)
        }
    }
}

extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        var position = layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        position.y -= oldPoint.y
        position.y += newPoint.y
        layer.position = position
        layer.anchorPoint = point
    }
}
