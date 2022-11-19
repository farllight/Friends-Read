//
//  BookListUIStateMapper.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 19.11.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import SwiftUI

final class BookListUIStateMapper {
    weak var viewModel: BookListViewModel?
    
    func handleChangedState(_ state: BookListState) {
        switch state {
        case .success:
            viewModel?.state = .success(items: [
                .init(
                    id: "1",
                    name: "Белый клык",
                    author: "Джек Лондон",
                    description: "Умная книжечка"
                )
            ])
        case .loading:
            viewModel?.state = .loading
        case .failure:
            viewModel?.state = .failure
        }
    }
}
