//
//  BoolListView.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 29.10.2022.
//  Copyright © 2022 friends_read. All rights reserved.
//

import SwiftUI

struct BookListView: View {
    @State
    private var selectedItem = 0
    
    @ObservedObject
    private var viewModel: BookListViewModel
    
    init(viewModel: BookListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .failure:
            EmptyView()
        case .loading:
            ProgressView()
                .onAppear {
                    viewModel.demand()
                }
        case let .success(items):
            makeContent(items: items)
        }
    }
    
    // MARK: - Content
    
    private func makeContent(items: [BookListItemViewModel]) -> some View {
        VStack {
            Picker(
                "Разделы",
                selection: $selectedItem,
                content: {
                    Text("Прочитаю").tag(0)
                    Text("Читаю").tag(1)
                    Text("Прочитал").tag(2)
                }
            )
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)
            .padding(.bottom, 12)
            
            List {
                ForEach(
                    items,
                    content: { item in
                        BookListItemView(viewModel: item)
                    }
                )
            }
        }
        .navigationTitle("Friends Read")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: viewModel.add) {
                    Image(systemName: "plus.app")
                }
            }
        }
    }
}
