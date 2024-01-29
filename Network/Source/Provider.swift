//
//  RequestProvidable.swift
//  Network
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation

@propertyWrapper
public struct RequestProvider {
    
    private static var requester: Requestable?
    private static var requesterClosure: (() -> Requestable)?
    
    private var requester: Requestable {
        if let requester = Self.requester {
            return requester
        }
        
        if let requesterClosure = Self.requesterClosure {
            let requester = requesterClosure()
            return requester
        }
        
        fatalError("need RequestProvider implementation in app")
    }
    
    public init() { }
    
    public var wrappedValue: Requestable {
        return requester
    }
    
    public static func set(_ requester: Requestable) {
        if self.requester == nil && self.requesterClosure == nil {
            self.requester = requester
        }
    }
    
    public static func set(_ closure: @escaping () -> Requestable) {
        if self.requester == nil && self.requesterClosure == nil {
            self.requesterClosure = closure
        }
    }
    
}
