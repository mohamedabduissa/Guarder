//
//  ViewController.swift
//  Validator-UI
//
//  Created by Mabdu on 30/09/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTxf: UITextField!
    @IBOutlet weak var passwordTxf: UITextField!
    
    var validator: Validator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        validator = .init(guardOnSuperViewOfTextField: true)
        validator?.setUIType(.label)
            .setUIType(.infoMark)
            .append(emailTxf, rules: [GuardEmail()], title: "Email")
            .append(passwordTxf, rules: [GuardRequired(), GuardLength(minimumLength: 8, maximumLength: nil)], title: "Password")
            
    }


    @IBAction func login(_ sender: Any) {
        validator?.build()
    }
}

