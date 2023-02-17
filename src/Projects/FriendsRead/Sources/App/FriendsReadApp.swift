//
//  FriendsReadApp.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 28.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import SwiftUI

@main
struct FriendsReadApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BookListFactoryImpl()
                    .make()
                    .view
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
