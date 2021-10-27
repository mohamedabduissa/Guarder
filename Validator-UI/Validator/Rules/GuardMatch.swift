//
//  GuardRequired.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard Match
internal struct GuardMatch: Guard {
    
    // MARK: - ...  vars
    private var matchWith: GuardedFacade?
    var textField: GuardedFacade!
    
    // MARK: - ...  init
    init(matchWith: GuardedFacade?) {
        self.matchWith = matchWith
    }
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        guard textField.text == matchWith?.text else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("doesn't match".localized)"
    }
}
