//
//  View+AsController.swift
//  DesignSystem
//
//  Created by Vladislav Markov on 18.02.2023.
//  Copyright © 2023 friends_read. All rights reserved.
//

import SwiftUI
import UIKit

/// Шорткат для быстрого заворачивания View в UIViewController
public extension View {
    func asController(
        willAppear: (() -> Void)? = nil,
        willDisappear: (() -> Void)? = nil,
        didAppear: (() -> Void)? = nil
    ) -> UIViewController {
        DeclarativeController(
            content: self,
            willAppear: willAppear,
            didAppear: didAppear,
            willDisappear: willDisappear
        )
    }
}
