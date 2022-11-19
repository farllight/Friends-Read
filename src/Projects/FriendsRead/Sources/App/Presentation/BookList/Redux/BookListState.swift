//
//  BookListState.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 31.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import Flowers

enum BookListState: FlowState {
    case loading
    case success
    case failure
}
