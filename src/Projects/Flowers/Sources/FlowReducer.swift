//
//  FlowReducer.swift
//  Flowers
//
//  Created by Vladislav Markov on 29.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

public protocol FlowReducer<Action, State, Effect> {
    associatedtype State: FlowState
    associatedtype Action: FlowAction
    associatedtype Effect: FlowEffect
    
    /// Чистая функция для смены состояний
    /// - returns:
    /// - state: Новое состояние
    /// - effects: массив эффектов, которые могут произойти
    ///
    func reduce(
        action: Action,
        state: State
    ) -> (
        state: State,
        effect: Effect?
    )
}
