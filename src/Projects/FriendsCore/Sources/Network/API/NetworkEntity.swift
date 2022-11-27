//
//  NetworkEntity.swift
//  NetworkAPI
//
//  Created by Vladislav Markov on 20.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

public protocol NetworkEntity: Decodable, Equatable {}

public struct VoidEntity: NetworkEntity {}
