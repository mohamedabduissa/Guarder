//
//  Combine.swift
//  CombineExample
//
//  Created by Mabdu on 11/10/2021.
//

import Foundation
import Combine


// MARK: - ... Publisher
class Publisher<T>: NSObject, Combine {
    var subscriptions = Set<AnyCancellable>()
    public private(set) var publisher: PassthroughSubject<T, PublisherError>?
    
    override init() {
        super.init()
        publisher = PassthroughSubject<T, PublisherError>()
    }
}

