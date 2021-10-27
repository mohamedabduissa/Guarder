//
//  ValidatorAlertable.swift
//  Validator-UI
//
//  Created by Mabdu on 27/10/2021.
//

import Foundation
import UIKit
protocol ValidatorAlertable: NSObjectProtocol {
    func makeAlert(_ view: UIViewController?, for message: String, noCancel: Bool?, closure: @escaping () -> Void )
}

extension ValidatorAlertable {
    func makeAlert(_ view: UIViewController?, for message: String, noCancel: Bool? = nil, closure: @escaping () -> Void ) {
        let alert = UIAlertController(title: "Alert".localized, message: message, preferredStyle: UIAlertController.Style.alert)
        let acceptAction = UIAlertAction(title: "Ok".localized, style: .default) { (_) -> Void in
            closure()
        }
        alert.addAction(acceptAction)
        if noCancel == nil {
            let cancelAction = UIAlertAction(title: "Cancel".localized, style: .default) { (_) -> Void in
            }
            alert.addAction(cancelAction)
        }
        view?.present(alert, animated: true, completion: nil)
    }
}
