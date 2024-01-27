//
//  SafeResponse.swift
//  NetworkExtension
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation

public enum SafeResponseErrors: Error {
    case dataNull
}

public final class SafeResponse {
    
    public var isEmpty: Bool {
        return data == nil ? true : false
    }
    
    public var data: Data?
    
    public func decodeToModel<T: Codable>() throws -> T {
        guard let unwrappedData = data else { throw SafeResponseErrors.dataNull }
        
        do {
            let data = try JSONDecoder().decode(T.self, from: unwrappedData)
            return data
        } catch {
            throw error
        }
        
    }
    
    public init(data: Data? = nil) {
        self.data = data
    }
    
}
