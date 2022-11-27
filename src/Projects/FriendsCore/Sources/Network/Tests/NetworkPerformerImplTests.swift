//
//  NetworkPerformerImplTests.swift
//  NetworkTests
//
//  Created by Vladislav Markov on 24.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

@testable import NetworkAPI
import NetworkImpl
import XCTest

final class NetworkPerformerImplTests: XCTestCase {
    private let session = URLSessionMock()
    private let interceptor = NetworkInterceptorMock()
    
    private lazy var sut = NetworkPerformerImpl(
        session: session,
        interceptor: interceptor
    )
    
    func test_Request_EndpointMakeRequestThrowed_ThrowsRequest() async {
        let endpoint = MockEndpoint()
        endpoint.makeRequestResult = .failure(TestError.error)
        
        do {
            _ = try await sut.request(endpoint)
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
        
        XCTAssertEqual(endpoint.inputs, [
            .makeRequest
        ])
        
        XCTAssertTrue(interceptor.inputs.isEmpty)
    }
    
    func test_Request_ThrowsAdaptRequest_ThrowsRequest() async {
        let endpoint = MockEndpoint()
        interceptor.adaptResult = .failure(TestError.error)
        
        do {
            _ = try await sut.request(endpoint)
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
        
        XCTAssertEqual(endpoint.inputs, [
            .makeRequest
        ])
        
        XCTAssertEqual(interceptor.inputs, [
            .adapt
        ])
    }
    
    func test_Request_ThrowsSession_RetryCalledAndPolicyNotRetry_Failed() async {
        let endpoint = MockEndpoint()
        interceptor.adaptResult = .success("anyRequest")
        session.dataResult = .failure(TestError.error)
        
        do {
            _ = try await sut.request(endpoint)
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
        
        XCTAssertEqual(endpoint.inputs, [
            .makeRequest
        ])
        
        XCTAssertEqual(interceptor.inputs, [
            .adapt,
            .retry
        ])
        
        XCTAssertEqual(session.inputs, [
            .data
        ])
    }
    
    func test_Request_ThrowsSession_RetryCalledAndPolicyRetry_Succeed() async throws {
        let endpoint = MockEndpoint()
        session.dataResult = .failure(TestError.error)
        session.changeError = true
        interceptor.retryResult = .retry
        
        _ = try await sut.request(endpoint)
        
        XCTAssertEqual(endpoint.inputs, [
            .makeRequest,
            .makeRequest,
            .makeContent
        ])
        
        XCTAssertEqual(interceptor.inputs, [
            .adapt,
            .retry,
            .adapt
        ])
        
        XCTAssertEqual(session.inputs, [
            .data,
            .data
        ])
    }
    
    func test_Request_AllValid_ReturnEntity() async throws {
        let endpoint = MockEndpoint()
        let entity = VoidEntity()
        endpoint.makeContentResult = .success(entity)
        
        let result = try await sut.request(endpoint)
        
        XCTAssertEqual(result, entity)
        
        XCTAssertEqual(endpoint.inputs, [
            .makeRequest,
            .makeContent
        ])
        
        XCTAssertEqual(session.inputs, [
            .data
        ])
        
        XCTAssertEqual(interceptor.inputs, [
            .adapt
        ])
    }
}
