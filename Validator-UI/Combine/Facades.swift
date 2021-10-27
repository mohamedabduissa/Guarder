//
//  Facades.swift
//  CombineExample
//
//  Created by Mabdu on 11/10/2021.
//

import Foundation
import Combine


protocol Template: NSObjectProtocol {
    /**
     associatedtype T
     # Notes: #
     1.  This type ref to dynamic type
     
     # Example #
     ```
     // Sender<T>
     ```
     */
    associatedtype T
}

protocol Combine: Template {
    /**
     The subscriptions values
     subscriptions: Set<AnyCancellable>
     # Notes: #
     1.  The subscriptions values
     
     */
    var subscriptions: Set<AnyCancellable> { get set }
}


protocol Sender: Template {
    
    /**
     send on Value
     
     - parameter input: Generic type.
     - returns: Void

     # Example #
     ```
     // send(0)
     ```
     */
    func send(_ input: T)
    /**
     send on Error
     
     - parameter error: PublisherError.
     - returns: Void
     
     # Example #
     ```
     // send(.network)
     ```
     */
    func send(error: PublisherError)
}

protocol Listener: Template {
    /**
     listen to ALL
     
     - parameter receiveCompletion: ((Subscribers.Completion<PublisherError>) -> Void), receiveValue: @escaping ((T) -> Void) .
     - returns: Void
     */
    func listen(receiveCompletion: @escaping ((Subscribers.Completion<PublisherError>) -> Void), receiveValue: @escaping ((T) -> Void))
    /**
     listen on error
     
     - parameter error on: ((Subscribers.Completion<PublisherError>) -> Void).
     - returns: Void
     */
    func listen(error on: @escaping ((Subscribers.Completion<PublisherError>) -> Void))
    /**
     listen on value
     
     - parameter value on: ((T) -> Void)).
     - returns: Void
     */
    func listen(value on: @escaping ((T) -> Void))
}
