//
//  TextFieldFacade.swift
//  Validator-UI
//
//  Created by Mabdu on 30/09/2021.
//

import Foundation
import UIKit
public protocol GuardedFacade: NSObjectProtocol {
    var id: UIView? { get }
    var text: String? { set get }
    var textColor: UIColor? { set get }
    var attributedPlaceholder: NSAttributedString? { set get }
    var superview: UIView? { get }
    var frame: CGRect { set get }
    var delegate: UITextFieldDelegate? { set get }
    func setPlaceHolderTextColor(_ color: UIColor)
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
}

extension GuardedFacade {
    public var id: UIView? {
        return self as? UIView
    }
    public var attributedPlaceholder: NSAttributedString? {
        get {
            return NSAttributedString()
        } set {
            
        }
    }
    public func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) { }
    public func setPlaceHolderTextColor(_ color: UIColor) { }
}

extension UITextField: GuardedFacade {
    
}
