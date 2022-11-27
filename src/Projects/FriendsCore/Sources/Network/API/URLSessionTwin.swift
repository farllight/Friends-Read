//
//  URLSessionTwin.swift
//  NetworkAPI
//
//  Created by Vladislav Markov on 20.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation

public protocol URLSessionTwin {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionTwin {}
