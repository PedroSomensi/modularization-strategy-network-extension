//
//  RequestProvidable.swift
//  Network
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation

final class RequestImplementation: Requestable {
    
    func call(
        request: Request,
        completion: @escaping (Response) -> Void
    ) {
        print("RequestImplementation Dummy - called - crash your app")
    }
    
}

@propertyWrapper
public struct RequestProvider {
    
    private static var implementation: Requestable = RequestImplementation()
    
    public var wrappedValue: Requestable {
        get {
            return Self.implementation
        }
        set {
            Self.implementation = newValue
        }
    }
    
    public init(requestable: Requestable? = nil) {
        guard let instance = requestable else { return }
        wrappedValue = instance
    }
    
}
