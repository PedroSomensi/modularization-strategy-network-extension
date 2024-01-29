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
    
}

public extension SafeRequestable {
    
    func safeCallApi(
        provider: Requestable,
        request: Request,
        completion: @escaping (Result<SafeResponse, Error>) -> Void
    ) {
        
        print("SafeRequest - apply rules")
        
        provider.call(request: request) { response in
            
            switch response {
            case .success(let obj):
                print("SA_Layer - callback of success")
                completion(.success(SafeResponse(data: obj.data)))
            case .failure(let error):
                print("SA_Layer - callback of error")
                completion(.failure(error))
            }
            
        }
        
    }
    
}
