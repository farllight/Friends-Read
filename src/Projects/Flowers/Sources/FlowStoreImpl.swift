//
//  FlowStoreImpl.swift
//  Flowers
//
//  Created by Vladislav Markov on 29.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Combine

public final class FlowStoreImpl<
    Action: FlowAction,
    State: FlowState,
    Effect: FlowEffect
>: FlowStore {
    // MARK: - Public properties
    public private(set) var state: State {
        didSet {
            guard oldValue != state else {
                return
            }
            
            stateChanged(state)
        }
    }
    
    // MARK: - Private properties
    private let reducer: any FlowReducer<Action, State, Effect>
    private let interactor: any FlowInteractor<Action, Effect>
    private let stateChanged: (State) -> Void
    
    // MARK: - Init
    public init(
        initialState: State,
        reducer: any FlowReducer<Action, State, Effect>,
        interactor: any FlowInteractor<Action, Effect>,
        stateChanged: @escaping (State) -> Void
    ) {
        self.state = initialState
        self.reducer = reducer
        self.interactor = interactor
        self.stateChanged = stateChanged
    }
    
    // MARK: - Dispatch
    public func dispatch(action: Action) {
        let (state, effect) = reducer.reduce(
            action: action,
            state: state
        )
        
        self.state = state
        
        Task {
            guard let effect = effect else {
                return
            }
            
            let action = await interactor.apply(effect: effect)
            
            if let action {
                dispatch(action: action)
            }
        }
    }
}
