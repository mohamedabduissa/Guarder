//
//  GuardRequired.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard phone
internal struct GuardPhone: Guard {
    
    // MARK: - ...  vars
    var textField: GuardedFacade!
    
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("is incorrect phone".localized)"
    }
}
