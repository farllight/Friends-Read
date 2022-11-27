//
//  URLSessionMock.swift
//  NetworkTests
//
//  Created by Vladislav Markov on 24.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation
import NetworkAPI

public final class URLSessionMock: URLSessionTwin {
    
    // MARK: - Input
    
    public enum Input: Equatable {
        case data
    }
    
    public private(set) var inputs = [Input]()
    
    public var changeError = false
    public var dataResult = Result<(Data, URLResponse), Error>.success((Data(), URLResponse()))
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        defer {
            if changeError {
                dataResult = .success((Data(), URLResponse()))
            }
        }
        
        inputs.append(.data)
        return try dataResult.get()
    }
}
