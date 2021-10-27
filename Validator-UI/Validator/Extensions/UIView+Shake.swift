//
//  UIView+Shake.swift
//  Validator-UI
//
//  Created by Mabdu on 30/09/2021.
//

import Foundation
import UIKit
extension UIView {
    /// Shake view.
    ///
    /// - Parameters:
    ///   - direction: shake direction (horizontal or vertical), (default is .horizontal)
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - animationType: shake animation type (default is .easeOut).
    ///   - completion: optional completion handler to run with animation finishes (default is nil).
    func shake(completion:(() -> Void)? = nil) {
        CATransaction.begin()
        let animation: CAKeyframeAnimation
        animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        CATransaction.setCompletionBlock(completion)
        animation.duration = 1
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
        CATransaction.commit()
    }
}
