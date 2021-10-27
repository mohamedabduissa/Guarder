//
//  GuardModel.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard model
internal class GuardModel: GuardUI {
    
    // MARK: - ...  vars
    var rules: [Guard]! = []
    var title: String?
    
    // MARK: - ...  functions
    
    internal init(textField: GuardedFacade) {
        super.init()
        self.textField = textField
    }
    @discardableResult
    func setTitle(_ title: String? = nil) -> Self {
        self.title = title
        return self
    }
    @discardableResult
    func rules(_ rules: [Guard]) -> Self {
        self.rules.append(contentsOf: rules)
        return self
    }
    @discardableResult
    func rule(_ rule: Guard) -> Self {
        self.rules.append(rule)
        return self
    }
    @discardableResult
    func holdColor() -> Self {
        self.holdColor = true
        return self
    }
    func errorMessage() -> String? {
        for var rule in self.rules ?? [] {
            rule.textField = self.textField
            if !rule.confirm() {
                return rule.errorMessage(self.title)
            }
        }
        return nil
    }
    internal func shake(_ superView: Bool = false) {
        if superView {
            textField.superview?.shake()
        } else {
            if let view = textField as? UIView {
                view.shake()
            }
        }
    }
}
