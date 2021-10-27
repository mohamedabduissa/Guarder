//
//  ValidatorInfoMarkUI+Ex.swift
//  BaseIOS
//
//  Created by Mabdu on 07/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Extension of validator Label error
extension ValidatorLabelUI {
    func insertLabel(in model: GuardModel?) {
        guard let model = model else { return }
        guard let view = model.textField.superview else { return }
        if model.view != nil {
            return
        }
        let containView = UIView()
        let label = UILabel()
        label.textColor = .red
        label.text = model.errorMessage()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containView)
        containView.addLeadingConstraint(toView: view, constant: model.textField.frame.origin.x + 4)
        containView.addTrailingConstraint(toView: view, constant: -15)
        containView.addBottomConstraint(toView: model.textField.id, constant: -2)
        containView.addHeightConstraint(toView: nil, constant: 20)
        
        containView.addSubview(label)
        label.addLeadingConstraint(toView: containView, constant: 0)
        label.addTrailingConstraint(toView: containView, constant: 0)
        label.addBottomConstraint(toView: containView, constant: 0)
        model.view = containView
        
        model.textField.textColor = .black
        model.textField.setPlaceHolderTextColor(.placeholderText)
        if let constraint = view.constraints.first(where: { $0.firstAttribute == .height }) {
            constraint.constant += 20
        }
        if let constraint = view.constraints.first(where: { $0.firstAttribute == .bottom }) {
            constraint.constant += 5
        }
    }
    func removeLabel(in model: GuardModel?) {
        if model?.view != nil {
            guard let view = model?.textField.superview else { return }
            if let constraint = view.constraints.first(where: { $0.firstAttribute == .height }) {
                constraint.constant -= 15
                model?.view?.removeFromSuperview()
                model?.view = nil
            }
            if let constraint = view.constraints.first(where: { $0.firstAttribute == .bottom }) {
                constraint.constant -= 10
            }
        }
    }
    
}

