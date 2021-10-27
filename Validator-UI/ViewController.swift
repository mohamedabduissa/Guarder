//
//  ViewController.swift
//  Validator-UI
//
//  Created by Mabdu on 30/09/2021.
//

import UIKit

class ViewController: UIViewController, ValidatorAlertable {
    @IBOutlet weak var emailTxf: UITextField!
    @IBOutlet weak var passwordTxf: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var validator: Validator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        validator = .init()
//        validator?.setUIType(.label)
//            .setUIType(.infoMark)
//            .setUIType(.message(view: self))
            .append(emailTxf, rules: [GuardEmail()], title: "Email")
            .append(passwordTxf, rules: [GuardRequired(), GuardLength(minimumLength: 8, maximumLength: nil)], title: "Password")
        
        emailTxf.superview?.layer.borderColor = UIColor.placeholderText.cgColor
        emailTxf.superview?.layer.borderWidth = 1
        
        validator?.subscribe()
        validator?.listen(on: { message in
            self.makeAlert(self, for: message ?? "", noCancel: true, closure: {})
        })
    }


    @IBAction func login(_ sender: Any) {
        validator?.build()
    }
}
