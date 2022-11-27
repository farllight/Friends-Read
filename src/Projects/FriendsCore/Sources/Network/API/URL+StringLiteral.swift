//
//  URL+StringLiteral.swift
//  NetworkAPI
//
//  Created by Vladislav Markov on 27.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        guard let url = URL(string: "\(value)") else {
            fatalError("Invalid URL string literal: \(value)")
        }
        self = url
    }
}
