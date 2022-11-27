//
//  NetworkInterceptor.swift
//  NetworkAPI
//
//  Created by Vladislav Markov on 20.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation

public enum RetryPolicy {
    case retry
    case doNotRetry
}

public protocol NetworkInterceptor {
    func adapt(_ request: URLRequest) throws -> URLRequest
    
    func retry(
        request: URLRequest,
        dueTo error: Error
    ) async -> RetryPolicy
}
