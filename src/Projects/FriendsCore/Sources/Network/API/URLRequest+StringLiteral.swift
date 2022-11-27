//
//  URLRequest+StringLiteral.swift
//  NetworkAPI
//
//  Created by Vladislav Markov on 27.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation

extension URLRequest: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        let url = URL(stringLiteral: value)
        self = URLRequest(url: url)
    }
}
