//
//  ValidatorFacade.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  handle UI 
protocol ValidatorUI: NSObjectProtocol {
    func handleTextFieldError(_ textField: GuardedFacade)
    func handleTextFieldSuccess(_ textField: GuardedFacade)
    func handleSuperViewOfTextField(_ textField: GuardedFacade, _ success: Bool)
    func handleUnderline(_ textField: GuardedFacade, _ success: Bool)
    func handleInfoMark(_ textField: GuardedFacade, _ success: Bool)
    func handleLabel(_ textField: GuardedFacade, _ success: Bool)
    func handleMessage(_ view: UIViewController, _ textField: GuardedFacade, _ success: Bool)
}


// MARK: - ...  Underline of superview in textfield
protocol ValidatorUnderlineUI: NSObjectProtocol {
    func insertUnderline(in model: GuardModel?)
    func removeUnderline(in model: GuardModel?)
}

// MARK: - ...  infomark error of superview in textfield
protocol ValidatorInfoMarkUI: NSObjectProtocol {
    func insertInfoMark(in model: GuardModel?)
    func removeInfoMark(in model: GuardModel?)
}

// MARK: - ...  infomark error of superview in textfield
protocol ValidatorLabelUI: NSObjectProtocol {
    func insertLabel(in model: GuardModel?)
    func removeLabel(in model: GuardModel?)
}

