//
//  BookListFactoryImpl.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 02.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Flowers
import DesignSystem

final class BookListFactoryImpl: BookListFactory {
    func make() -> BookListFeature {
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
            state: .loading,
            onEvent: { event in
                coordinator.handle(event)
            }
        )
        uiMapper.viewModel = viewModel
        
        let view = BookListView(viewModel: viewModel)
            .asController()
        return BookListFeature(view: view)
    }
}
