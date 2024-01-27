//
//  Requestable.swift
//  Network
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation

@frozen
public enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public struct Request {
    public var method: Method
    public var endpoint: String
    public var additionalInfos: [String: Any]? = nil
    
    public init(method: Method, endpoint: String, additionalInfos: [String : Any]? = nil) {
        self.method = method
        self.endpoint = endpoint
        self.additionalInfos = additionalInfos
    }
}

public protocol Requestable {
    
    func call(
        request: Request,
        completion: @escaping (Response) -> Void
    )
    
}
