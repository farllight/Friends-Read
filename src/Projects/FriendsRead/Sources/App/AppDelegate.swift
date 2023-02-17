//
//  AppDelegate.swift
//  FriendsRead
//
//  Created by Vladislav Markov on 18.02.2023.
//  Copyright © 2023 friends_read. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let factory = BookListFactory()
        
        window.rootViewController = factory.make(input: BookListParams()).controller
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
