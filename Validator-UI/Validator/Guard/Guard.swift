//
//  Guard.swift
//  BaseIOS
//
//  Created by Mabdu on 06/06/2021.
//  Copyright © 2021 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard
public protocol Guard {
    var textField: GuardedFacade! { get set }
    func confirm() -> Bool
    func errorMessage(_ field: String?) -> String?
}
