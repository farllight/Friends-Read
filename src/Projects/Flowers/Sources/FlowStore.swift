//
//  FlowStore.swift
//  Flowers
//
//  Created by Vladislav Markov on 29.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Combine

public protocol FlowStore<Action, State> {
    associatedtype Action: FlowAction
    associatedtype State: FlowState
    
    var state: State { get }
    
    func dispatch(action: Action)
}
