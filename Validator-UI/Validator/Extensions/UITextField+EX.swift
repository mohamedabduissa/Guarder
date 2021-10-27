//
//  UITextField+EX.swift
//  Validator-UI
//
//  Created by Mabdu on 30/09/2021.
//

import Foundation
import UIKit

extension UITextField {
    /// Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    public func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        self.attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
}
