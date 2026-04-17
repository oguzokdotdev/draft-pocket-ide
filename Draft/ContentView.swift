import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Section("Quick actions") {
                    Button(action: { /* Logic */ }) {
                        Label("New file", systemImage: "plus.circle")
                    }
                    Button(action: { /* Logic */ }) {
                        Label("Open file", systemImage: "folder")
                    }
                }
                
                Section("Recent files") {
                    NavigationLink(value: "test.py") {
                        Label("test.py", systemImage: "doc.text")
                    }
                }
            }
            .navigationTitle("Draft")
            
            .safeAreaInset(edge: .bottom) {
                Button(action: { /* Homepage logic */ }) {
                    Label("Home", systemImage: "house")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.ultraThinMaterial)
                }
            }
        } detail: {
            ContentUnavailableView("No File Selected", systemImage: "doc.badge.plus")
        }
    }
}