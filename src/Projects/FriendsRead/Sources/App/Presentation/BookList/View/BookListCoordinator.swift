//
//  BookListCoordinator.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 19.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Flowers

final class BookListCoordinator {
    private let store: any FlowStore<BookListAction, BookListState>
    
    public init(store: any FlowStore<BookListAction, BookListState>) {
        self.store = store
    }
    
    func handle(_ event: BookListViewModel.Event) {
        switch event {
        case .start:
            store.dispatch(action: .load)
        case .tap:
            store.dispatch(action: .tap)
        }
    }
}
