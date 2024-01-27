//
//  SafeRequestable.swift
//  NetworkExtension
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation
import Network

public protocol SafeRequestable {
    
    func safeCallApi(
        provider: Requestable,
        request: Request,
        completion: @escaping (Result<SafeResponse, Error>) -> Void
    )
    
    func safeCallApi(
        provider: Requestable,
        request: Request,
        completion: @escaping (Response) -> Void
    )
    
}

public extension SafeRequestable {
    
    func safeCallApi(
        provider: Requestable,
        request: Request,
        completion: @escaping (Result<SafeResponse, Error>) -> Void
    ) {
        
        print("SafeRequest - apply rules")
        
        provider.call(request: request) { response in
            
            if response.error != nil {
                print("SA_Layer - callback of error")
                completion(.failure(response.error!))
            }
            
            print("SA_Layer - callback of success")
            completion(.success(SafeResponse(data: response.data)))
        }
        
    }
    
    func safeCallApi(
        provider: Requestable,
        request: Request,
        completion: @escaping (Response) -> Void
    ) {
        
        print("SafeRequest - apply rules")
        
        provider.call(request: request) { response in
            
            if response.error != nil {
                print("SA_Layer - callback of error")
                completion(response)
            }
            
            print("SA_Layer - callback of success")
            completion(response)
            
        }
        
    }
    
}
