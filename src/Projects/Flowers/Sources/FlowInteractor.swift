//
//  FlowInteractor.swift
//  Flowers
//
//  Created by Vladislav Markov on 30.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

public protocol FlowInteractor<Action, Effect> {
    associatedtype Action: FlowAction
    associatedtype Effect: FlowEffect
    
    func apply(effect: Effect) async -> Action?
}
