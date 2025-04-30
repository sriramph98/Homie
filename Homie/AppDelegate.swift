import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication,
                    open url: URL,
                    options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme?.contains("com.sriram.homie") == true {
            // Handle the authentication callback
            Task {
                do {
                    try await SupabaseManager.shared.client.auth.session(from: url)
                    // Update your app's authentication state here
                    NotificationCenter.default.post(name: NSNotification.Name("AuthenticationSuccessful"), object: nil)
                } catch {
                    print("Error handling auth callback: \(error)")
                }
            }
            return true
        }
        return false
    }
} 