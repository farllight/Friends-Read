//
//  NetworkPerformerImpl.swift
//  NetworkImpl
//
//  Created by Vladislav Markov on 20.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation
import NetworkAPI

public final class NetworkPerformerImpl: NetworkPerformer {
    private let session: URLSessionTwin
    private let interceptor: NetworkInterceptor
    
    public init(
        session: URLSessionTwin,
        interceptor: NetworkInterceptor
    ) {
        self.session = session
        self.interceptor = interceptor
    }
    
    public func request<Endpoint: NetworkEndpoint>(
        _ endpoint: Endpoint
    ) async throws -> Endpoint.Content  {
        let request = try endpoint.makeRequest()
        let modifiedRequest = try interceptor.adapt(request)
        
        do {
            let (data, response) = try await session.data(for: modifiedRequest)
            
            if let response = response as? HTTPURLResponse {
                try endpoint.validate(
                    request: request,
                    response: response,
                    data: data
                )
            }
            
            return try endpoint.makeContent(
                from: response,
                with: data
            )
        } catch {
            let retryPolicy = await interceptor.retry(
                request: request,
                dueTo: error
            )
            
            switch retryPolicy {
            case .retry:
                return try await self.request(endpoint)
            case .doNotRetry:
                throw error
            }
        }
    }
}
