import Foundation
import Supabase

enum Provider: String {
    case google = "google"
    case apple = "apple"
}

class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        let supabaseURL = "https://avjfuyuwoldrdrntwkcy.supabase.co"
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2amZ1eXV3b2xkcmRybnR3a2N5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU2NjYwNjEsImV4cCI6MjA2MTI0MjA2MX0.xjK6myOW3yN_DdHubl2nu8j2EttZKicEASgT6sBXW64"
        
        // Initialize Supabase client with auth callback URL
        self.client = SupabaseClient(
            supabaseURL: URL(string: supabaseURL)!,
            supabaseKey: supabaseKey
        )
    }
    
    func getOAuthSignInURL(provider: Provider) -> URL? {
        let baseURL = "https://avjfuyuwoldrdrntwkcy.supabase.co/auth/v1/authorize"
        let queryItems = [
            URLQueryItem(name: "provider", value: provider.rawValue),
            URLQueryItem(name: "redirect_to", value: "com.sriram.homie://auth-callback"),
            URLQueryItem(name: "open_in", value: "safari")
        ]
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
} 
