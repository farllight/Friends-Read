//
//  BookListReducer.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 31.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Flowers

final class BookListReducer: FlowReducer {
    func reduce(
        action: BookListAction,
        state: BookListState
    ) -> (
        state: BookListState,
        effect: BookListEffect?
    ) {
        switch action {
        case .load:
            return (state: .success, effect: nil)
        case .tap, .add:
            return (state: state, effect: nil)
        }
    }
    
}
