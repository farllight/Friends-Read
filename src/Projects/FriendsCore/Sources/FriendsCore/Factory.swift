//
//  Factory.swift
//  FriendsCore
//
//  Created by Vladislav Markov on 18.02.2023.
//  Copyright © 2023 friends_read. All rights reserved.
//

/// Фабрика на дженериках
/// - generic Input: входные параметры, которые подаются в контексте использования фабрики
/// - generic Output: тип создаваемого объекта
public final class Factory<Input, Output> {
    /// Порождающее замыкание
    private let closure: (Input) -> Output

    public init(closure: @escaping (Input) -> Output) {
        self.closure = closure
    }

    /// Порождающий метод для фабрики
    /// - parameter input: Входные параметры, которые передаются не через DI-контейнеры
    public func make(input: Input) -> Output {
        closure(input)
    }
}

extension Factory where Input == Void {
    /// Порождающий метод для фабрики
    public func make() -> Output {
        make(input: ())
    }
}
