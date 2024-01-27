//
//  FeatureApi.swift
//  Feature
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation
import Network
import NetworkExtension

final public class FeatureInitialiazer {
    
    public init(safeProvider: SafeRequestable) {
        print("Feature: Iniciada")
        _ = FeatureApiService(provider: safeProvider)
    }
    
}

final class FeatureApiService {
    
    @RequestProvider
    var saProvider: Requestable
    
    private let provider: SafeRequestable
    
    init(provider: SafeRequestable) {
        self.provider = provider
        print("Feature: API Service iniciado")
        getBalance()
    }
    
    func getBalance() {
        let request = Request(method: .post, endpoint: "balance")
        print("Feature: getBalance started with: SafeRequest")
        
        provider.safeCallApi(provider: saProvider,
                             request: request) { result in
            
            switch result {
            case .success(let response):
                print("SafeRequest: getBalance finished with response: \(response)")
            case .failure(let error):
                print("SafeRequest: getBalance finished with error: \(error)")
            }
            
            print("Feature: reviced result from backend")
            
        }
        
        // or
        /*
        provider.safeCallApi(provider: saProvider, request: request) { response in
            
            if response.data != nil {
                print("Feature: getBalance finished with response: \(response)")
            } else {
                print("Feature: getBalance finished with error: \(response.error)")
            }
            
            print("Feature: reviced result from backend")
        }
        */
    }
    
}
