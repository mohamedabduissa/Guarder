//
//  GuardRequired.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ...  Guard required
internal struct GuardRequired: Guard {
    
    // MARK: - ...  vars
    var textField: GuardedFacade!

    // MARK: - ... functions
    func confirm() -> Bool {
        guard !(textField?.text?.isEmpty ?? false) else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("is required".localized)"
    }
}
