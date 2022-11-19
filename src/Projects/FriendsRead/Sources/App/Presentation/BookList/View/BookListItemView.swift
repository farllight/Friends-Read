//
//  BookListItemView.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 29.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import SwiftUI

struct BookListItemView: View {
    
    private let viewModel: BookListItemViewModel
    
    init(viewModel: BookListItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.name)
                    .font(.headline)
                
                Spacer()

                Text(viewModel.author)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 8)
                    
            if let description = viewModel.description {
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 8)
            }
        }
    }
}

struct BookListItemView_Preview: PreviewProvider {
    static var previews: some View {
        BookListItemView(viewModel: .init(
            id: "1",
            name: "Белый клык",
            author: "Джек Лондон",
            description: "Давно хочу почитать"
        ))
    }
}
