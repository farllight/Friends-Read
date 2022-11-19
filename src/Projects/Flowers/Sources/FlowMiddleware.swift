//
//  FlowMiddleware.swift
//  Flowers
//
//  Created by Vladislav Markov on 30.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

public protocol FlowMiddleware<Action> {
    associatedtype Action: FlowAction

    func execute() async -> Action?
}
