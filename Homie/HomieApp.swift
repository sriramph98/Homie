//
//  HomieApp.swift
//  Homie
//
//  Created by Sriram P H on 4/30/25.
//

import SwiftUI

@main
struct HomieApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var isAuthenticated = false
    
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                MainTabView()
            } else {
                AuthenticationView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}
