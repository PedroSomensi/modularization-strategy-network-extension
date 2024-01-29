//
//  AppImplementation.swift
//  NetworkExtension
//
//  Created by Pedro Somensi on 27/01/24.
//

import Foundation
import Network
import Feature
import NetworkExtension

final class AppImplementation {
    
    init() {
        setupAppRequest()
        _ = FeatureInitialiazer(safeProvider: SafeRequest())
    }
    
    private func setupAppRequest() {
        RequestProvider.set(AppRequest())
        print("Injetado SA_Layer: AppRequest para features!!")
    }
    
}


final class SafeRequest: SafeRequestable {
    /* identifier environemtns etc... */
}

final class AppRequest: Requestable {
    
    func call(request: Network.Request, completion: @escaping (Result<Network.Response, Error>) -> Void) {
        print("SA_Layer: from App")
        completion(.success(Response()))
    }
    
}
