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
    public var headers: [String: String]?
    public var body: Data?
    var timeout: TimeInterval?
    public var additionalInfos: [String: Any]? = nil
    
    public init(
        method: Method,
        endpoint: String,
        headers: [String : String]? = nil,
        body: Data? = nil,
        timeout: TimeInterval? = nil,
        additionalInfos: [String : Any]? = nil)
    {
        self.method = method
        self.endpoint = endpoint
        self.headers = headers
        self.body = body
        self.timeout = timeout
        self.additionalInfos = additionalInfos
    }
}

public protocol Requestable {
    
    func call(
        request: Request,
        completion: @escaping (Result<Response, Error>) -> Void
    )
    
}
