//
//  ValidatorInfoMarkUI+Ex.swift
//  BaseIOS
//
//  Created by Mabdu on 07/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Extension of validator info mark
extension ValidatorInfoMarkUI {
    func insertInfoMark(in model: GuardModel?) {
        guard let model = model else { return }
        guard let view = model.textField.superview else { return }
        
        let infoMark = UIImageView()
        infoMark.image = UIImage(named: "exclamation-mark-in-a-circle")
        view.addSubview(infoMark)
        infoMark.addCenterYConstraint(toView: view)
        infoMark.addTrailingConstraint(toView: view, constant: -15)
        infoMark.addHeightConstraint(toView: nil, constant: 25)
        infoMark.addWidthConstraint(toView: nil, constant: 25)
        model.imageView = infoMark
    }
    func removeInfoMark(in model: GuardModel?) {
        guard let model = model else { return }
        guard let view = model.textField.superview else { return }
        for view in view.subviews {
            if let image = view as? UIImageView {
                if image.image == UIImage(named: "exclamation-mark-in-a-circle") {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
