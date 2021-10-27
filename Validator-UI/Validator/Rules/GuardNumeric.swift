//
//  GuardRequired.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard Numeric
internal struct GuardNumeric: Guard {
    
    // MARK: - ...  vars
    var textField: GuardedFacade!
    
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        guard textField.text?.isNumeric == true else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("is incorrect numeric".localized)"
    }
}
