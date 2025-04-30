import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TasksView()
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
            
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
        }
    }
}

struct TasksView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Your tasks will appear here")
            }
            .navigationTitle("Tasks")
        }
    }
}

struct ScheduleView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Your schedule will appear here")
            }
            .navigationTitle("Schedule")
        }
    }
}

struct ChatView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Your chats will appear here")
            }
            .navigationTitle("Chat")
        }
    }
} 