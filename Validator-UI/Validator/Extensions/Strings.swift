//
//  Strings.swift
//  Validator-UI
//
//  Created by Mabdu on 30/09/2021.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
    /// Check if string is valid email format.
    ///
    ///        "john@doe.com".isEmail -> true
    ///
    var isEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                     options: .regularExpression, range: nil, locale: nil) != nil
    }
    /// Check if string is a valid Swift number.
    ///
    /// Note:
    /// In North America, "." is the decimal separator,
    /// while in many parts of Europe "," is used,
    ///
    ///        "123".isNumeric -> true
    ///     "1.3".isNumeric -> true (en_US)
    ///     "1,3".isNumeric -> true (fr_FR)
    ///        "abc".isNumeric -> false
    ///
    var isNumeric: Bool {
        let scanner = Scanner(string: self)
        scanner.locale = NSLocale.current
        let decimal = scanner.scanDecimal()
        return decimal != nil && scanner.isAtEnd
    }
}
