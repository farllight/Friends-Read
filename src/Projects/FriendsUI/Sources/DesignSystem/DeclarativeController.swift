//
//  DeclarativeController.swift
//  DesignSystem
//
//  Created by Vladislav Markov on 18.02.2023.
//  Copyright © 2023 friends_read. All rights reserved.
//

import SwiftUI
import UIKit

/// Унификация шаблонного контроллера, через который происходит навигация.
/// Позволяет не писать шаблонный код
open class DeclarativeController<Content: View>: UIViewController {
    // MARK: - Private Properties

    private let hostingController: UIHostingController<Content>

    private let didAppear: (() -> Void)?
    private let willDisappear: (() -> Void)?
    private let willAppear: (() -> Void)?

    // MARK: - Init

    public init(
        content: Content,
        willAppear: (() -> Void)? = nil,
        didAppear: (() -> Void)? = nil,
        willDisappear: (() -> Void)? = nil
    ) {
        hostingController = UIHostingController(rootView: content)
        self.willAppear = willAppear
        self.didAppear = didAppear
        self.willDisappear = willDisappear
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder _: NSCoder) {
        return nil
    }

    // MARK: - UIViewController

    override open func viewDidLoad() {
        super.viewDidLoad()
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppear?()
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppear?()
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        willDisappear?()
    }
}

