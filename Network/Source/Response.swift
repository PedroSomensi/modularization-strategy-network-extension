//
//  Response.swift
//  Network
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation

public final class Response {
    
    public var response: URLResponse?
    
    public var data: Data?
    public var error: Error?
    
    public init(
        response: URLResponse? = nil,
        data: Data? = nil,
        error: Error? = nil
    ) {
        self.response = response
        self.data = data
        self.error = error
    }
    
}
