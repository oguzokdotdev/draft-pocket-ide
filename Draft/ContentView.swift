import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationSplitView {
                List {
                    Section("home.actions") {
                        Button(action: { /* Logic */ }) {
                            Label("home.actions.newFile", systemImage: "plus.circle")
                        }
                        Button(action: { /* Logic */ }) {
                            Label("home.actions.openFolder", systemImage: "folder")
                        }
                    }
                    
                    Section("home.recent") {
                        NavigationLink(value: "test.py") {
                            Label("test.py", systemImage: "doc.text")
                        }
                    }
                }
                .navigationTitle("Draft")
            } detail: {
                ContentUnavailableView("No File Selected", systemImage: "doc.badge.plus")
            }
            .tabItem {
                Label("home", systemImage: "house.fill")
            }
            .tag(0)
            
            // Settings tab
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(1)
        }
    }
}
