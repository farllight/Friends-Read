//
//  MockEndpoint.swift
//  NetworkTests
//
//  Created by Vladislav Markov on 27.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

@testable import NetworkAPI
import Foundation

final class MockEndpoint: NetworkEndpoint {
    
    // MARK: - Input
    
    enum Input {
        case makeRequest
        case makeContent
        case validate
    }
    
    private(set) var inputs = [Input]()
    
    public var makeRequestResult = Result<URLRequest, Error>.success("any")
    func makeRequest() throws -> URLRequest {
        inputs.append(.makeRequest)
        return try makeRequestResult.get()
    }
    
    public var makeContentResult = Result<VoidEntity, Error>.success(VoidEntity())
    func makeContent(
        from response: URLResponse,
        with body: Data
    ) throws -> VoidEntity {
        inputs.append(.makeContent)
        return try makeContentResult.get()
    }
    
    public var validateResult = Result<Void, Error>.success(())
    func validate(
        request: URLRequest,
        response: HTTPURLResponse,
        data: Data
    ) throws {
        inputs.append(.validate)
        return try validateResult.get()
    }
}
