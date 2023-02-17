//
//  BookListFactory.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 02.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import DesignSystem
import Flowers
import FriendsCore

struct BookListParams {}

typealias BookListFactory = FeatureFactory<BookListParams>

extension BookListFactory {
    convenience init() {
        self.init { params in
            let reducer = BookListReducer()
            let interactor = BookListInteractor()
    
            let uiMapper = BookListUIStateMapper()
    
            let store = FlowStoreImpl(
                initialState: BookListState.loading,
                reducer: reducer,
                interactor: interactor,
                stateChanged: { state in
                    uiMapper.handleChangedState(state)
                }
            )
    
            let coordinator = BookListCoordinator(store: store)
            let viewModel = BookListViewModel(
                state: .success(items: []),
                onEvent: { event in
                    coordinator.handle(event)
                }
            )
            
            let controller = BookListView(viewModel: viewModel)
                .asController()
            
            return Feature(controller: controller)
        }
    }
}
