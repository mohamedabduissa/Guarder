//
//  Validator.swift
//  FormValidator
//
//  Created by Islam  on 6/2/21.
//

import Foundation
import UIKit


// MARK: - ...  Validator class
open class Validator: NSObject {
    // MARK: - ...  vars
    private var guards: [GuardModel] = []
    private var guardOnSuperViewOfTextField: Bool = false
    private var holdAllOldColors: Bool = false
    private var validatorUIType: [ValidatorUIType] = [.none]
    weak var delegate: ValidatorTextFieldDelegate?
    
    // MARK: - ...  init
    override init() { }

    init(guardOnSuperViewOfTextField: Bool = false) {
        self.guardOnSuperViewOfTextField = guardOnSuperViewOfTextField
    }
    init(holdAllOldColors: Bool = false) {
        self.holdAllOldColors = holdAllOldColors
    }
    init(guardOnSuperViewOfTextField: Bool = false, holdAllOldColors: Bool = false) {
        self.guardOnSuperViewOfTextField = guardOnSuperViewOfTextField
        self.holdAllOldColors = holdAllOldColors
    }
    @discardableResult
    func setUIType(_ type: ValidatorUIType) -> Self {
        self.validatorUIType.append(type)
        return self
    }
    @discardableResult
    func build() -> Bool {
        return validate
    }
}

// MARK: - ...  append
extension Validator {
    @discardableResult
    public func append(_ textField: GuardedFacade, rules: [Guard], title: String?) -> Self {
        textField.delegate = self
        textField.addTarget(self, action: #selector(Validator.textFieldDidChange(_:)), for: .editingChanged)
        let model = GuardModel(textField: textField).rules(rules).setTitle(title)
        if holdAllOldColors {
            model.holdColor()
        }
        guards.append(model)
        return self
    }
}
// MARK: - ...  validate
extension Validator {
    private var validate: Bool {
        var successValidate = true
        for textField in guards {
            if !validateGuard(textField) {
                successValidate = false
                break
            }
        }
        return successValidate
    }
}


// MARK: - ...  Validator guard
extension Validator: ValidatorGuard {
    internal func validateGuard(_ textField: GuardedFacade) -> Bool? {
        for guardObject in guards {
            if guardObject.textField.id == textField.id {
                return validateGuard(guardObject)
            }
        }
        return nil
    }
    internal func validateGuard(_ textField: GuardModel) -> Bool {
        var successValidate = true
        for var rule in textField.rules {
            rule.textField = textField.textField
            if !rule.confirm() {
                successValidate = false
                textField.shake(guardOnSuperViewOfTextField)
                handleTextFieldError(textField.textField)
                handleSuperViewOfTextField(textField.textField, false)
            } else {
                handleTextFieldSuccess(textField.textField)
                handleSuperViewOfTextField(textField.textField, true)
            }
        }
        return successValidate
    }
    internal func guardModel(_ textField: GuardedFacade) -> GuardModel? {
        for index in 0..<guards.count {
            if guards[index].textField.id == textField.id {
                return guards[index]
            }
        }
        return nil
    }
}

// MARK: - ...  Handle UI
extension Validator: ValidatorUI, ValidatorUnderlineUI, ValidatorInfoMarkUI, ValidatorLabelUI {
    internal func handleTextFieldError(_ textField: GuardedFacade) {
        if textField.text?.isEmpty == false {
            textField.textColor = .red
        } else {
            textField.setPlaceHolderTextColor(.red)
        }
    }
    internal func handleTextFieldSuccess(_ textField: GuardedFacade) {
        let model = guardModel(textField)
        if textField.text?.isEmpty == false {
            textField.textColor = model?.oldTextColor ?? .black
        } else {
            textField.setPlaceHolderTextColor(model?.oldPlaceHolderColor ?? .placeholderText)
        }
    }
    internal func handleSuperViewOfTextField(_ textField: GuardedFacade, _ success: Bool) {
        for ui in validatorUIType {
            switch ui {
            case .infoMark:
                handleInfoMark(textField, success)
            case .underline:
                handleUnderline(textField, success)
            case .label:
                handleLabel(textField, success)
            case .message:
                handleMessage(textField, success)
            case .scroll(let scroll):
                handleScroll(scroll, for: textField)
            default:
                break
            }
        }
    }
    
    internal func handleUnderline(_ textField: GuardedFacade, _ success: Bool) {
        if !guardOnSuperViewOfTextField {
            return
        }
        let model = guardModel(textField)
        if success {
            removeUnderline(in: model)
        } else {
            insertUnderline(in: model)
        }
    }
    internal func handleInfoMark(_ textField: GuardedFacade, _ success: Bool) {
        if !guardOnSuperViewOfTextField {
            return
        }
        let model = guardModel(textField)
        if success {
            removeInfoMark(in: model)
        } else {
            insertInfoMark(in: model)
        }
    }
    internal func handleLabel(_ textField: GuardedFacade, _ success: Bool) {
        if !guardOnSuperViewOfTextField {
            return
        }
        let model = guardModel(textField)
        if success {
            removeLabel(in: model)
        } else {
            insertLabel(in: model)
        }
    }
    internal func handleScroll(_ scrollView: UIScrollView, for textField: GuardedFacade) {
        let point = CGPoint(x: scrollView.frame.origin.x, y: textField.frame.origin.y)
        scrollView.setContentOffset(point, animated: true)
    }
    internal func handleMessage(_ textField: GuardedFacade, _ success: Bool) {
        let model = guardModel(textField)
        if !success {
            //NotificationBuilder().setBody(model?.errorMessage()).bulid()
        }
    }
}


// MARK: - ...  TextField Delegation
extension Validator: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        handleTextFieldSuccess(textField)
        if guardOnSuperViewOfTextField {
            handleSuperViewOfTextField(textField, true)
        }
        delegate?.textFieldDidBeginEditing?(textField)
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if validateGuard(textField) == true {
            handleTextFieldSuccess(textField)
            if guardOnSuperViewOfTextField {
                handleSuperViewOfTextField(textField, true)
            }
        } else {
            handleTextFieldError(textField)
            if guardOnSuperViewOfTextField {
                handleSuperViewOfTextField(textField, false)
            }
        }
        delegate?.textFieldDidEndEditing?(textField)
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        // MARK: - ...  Check is max char in text field
        let model = guardModel(textField)
        for rule in model?.rules ?? [] {
            if let rule = rule as? GuardLength {
                if let max = rule.max {
                    if newString.length >= max {
                        return false
                    } else {
                        return true
                    }
                }
            }
        }
        return true
    }
    @objc internal func textFieldDidChange(_ textField: UITextField) {
        handleTextFieldSuccess(textField)
        if guardOnSuperViewOfTextField {
            handleSuperViewOfTextField(textField, true)
        }
        delegate?.textFieldDidChange?(textField)
    }
}



