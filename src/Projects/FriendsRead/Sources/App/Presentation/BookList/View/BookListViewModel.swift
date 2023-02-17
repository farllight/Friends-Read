//
//  BookListViewModel.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 29.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import SwiftUI

final class BookListViewModel: ObservableObject {
    
    // MARK: - Nested

    enum State {
        case loading
        case failure
        case success(items: [BookListItemViewModel])
    }
    
    enum Event {
        /// Загрузка данных
        case start
        
        /// Добавление новой книги в список
        case add
        
        /// Пока не используется
        case tap
    }
    
    @Published
    var state: State
    
    private let onEvent: (Event) -> Void
    
    init(
        state: State,
        onEvent: @escaping (Event) -> Void
    ) {
        self.onEvent = onEvent
        self.state = state
    }
    
    func demand() {
        onEvent(.start)
    }
    
    func add() {
        onEvent(.add)
    }
}
