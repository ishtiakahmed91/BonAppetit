//
//  SceneDelegate.swift
//  BonAppetit
//
//  Created by Ishtiak Ahmed on 14.04.20.
//  Copyright © 2020 ia. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var userInfoHolder = UserInfoHolder()
    var foodCartHolder = FoodCartHolder()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
             let window = UIWindow(windowScene: windowScene)
                   window.rootViewController = UIHostingController(rootView: ContentView()
                    .environmentObject(userInfoHolder)
                    .environmentObject(foodCartHolder))
                   self.window = window
                   window.makeKeyAndVisible()
        }
    }
}

