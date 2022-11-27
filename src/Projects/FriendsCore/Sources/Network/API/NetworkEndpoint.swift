//
//  NetoworkEndpoint.swift
//  NetworkAPI
//
//  Created by Vladislav Markov on 20.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation

public protocol NetworkEndpoint {
    associatedtype Content: NetworkEntity
    
    func makeRequest() throws -> URLRequest
    
    func makeContent(
        from response: URLResponse,
        with body: Data
    ) throws -> Content
    
    func validate(
        request: URLRequest,
        response: HTTPURLResponse,
        data: Data
    ) throws
}
