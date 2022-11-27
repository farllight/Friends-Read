//
//  NetworkInteceptorMock.swift
//  NetworkTests
//
//  Created by Vladislav Markov on 24.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation
import NetworkAPI

public final class NetworkInterceptorMock: NetworkInterceptor {
    
    // MARK: - Input
    
    public enum Input {
        case adapt
        case retry
    }
    
    public private(set) var inputs = [Input]()
    
    public var adaptResult = Result<URLRequest, Error>.success("any")
    public func adapt(_ request: URLRequest) throws -> URLRequest {
        inputs.append(.adapt)
        return try adaptResult.get()
    }
    
    public var retryResult = RetryPolicy.doNotRetry
    public func retry(
        request: URLRequest,
        dueTo error: Error
    ) async -> RetryPolicy {
        inputs.append(.retry)
        return retryResult
    }
}
