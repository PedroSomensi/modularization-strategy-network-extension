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
        @RequestProvider(requestable: AppRequest())
        var requestProvider: Requestable
        print("Injetado SA_Layer: AppRequest para features!!")
    }
    
}


final class SafeRequest: SafeRequestable {
    /* identifier environemtns etc... */
}

final class AppRequest: Requestable {
    
    func call(request: Network.Request, completion: @escaping (Network.Response) -> Void) {
        print("SA_Layer: from App")
        completion(Response())
    }
    
}
