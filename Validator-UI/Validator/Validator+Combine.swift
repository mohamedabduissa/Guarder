//
//  Validator+Combine.swift
//  Validator-UI
//
//  Created by Mabdu on 27/10/2021.
//

import Foundation

protocol ValidatorObserve: NSObjectProtocol {
    func subscribe()
    func send(on message: String?)
    func listen(on value: @escaping ((String?) -> Void))
}

extension Validator: ValidatorObserve {
    func subscribe() {
        self.publisher = .init()
    }
    func send(on message: String?) {
        self.publisher?.send(message)
    }
    func listen(on value: @escaping ((String?) -> Void)) {
        self.publisher?.listen(value: value)
    }
}
