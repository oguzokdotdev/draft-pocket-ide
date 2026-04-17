import SwiftUI

// MARK: - Home View
struct HomeView: View {
    var body: some View {
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
    }
}

// MARK: - Settings View
struct SettingsView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String?
    @AppStorage("selectedAppearance") private var selectedAppearance: String?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("settings.language", selection: $selectedLanguage) {
                        Text("settings.language.system").tag(String?.none)
                    }
                }
                Section {
                    Picker("settings.language", selection: $selectedLanguage) {
                        Text("settings.language.en").tag(String?("en"))
                        Text("settings.language.ru").tag(String?("ru"))
                    }
                }
                
                Section {
                    Picker("settings.appearance", selection: $selectedAppearance) {
                        Text("settings.appearance.system").tag(String?.none)
                    }
                }
                Section {
                    Picker("settings.appearance", selection: $selectedAppearance) {
                        Text("settings.appearance.dark").tag(String?("dark"))
                        Text("settings.appearance.light").tag(String?("light"))
                    }
                }
            }
            .navigationTitle("settings.title")
        }
    }
}

// MARK: - Main Content View
struct ContentView: View {
    @State private var selectedTab = 0
    @AppStorage("selectedLanguage") private var selectedLanguage: String?
    @AppStorage("selectedAppearance") private var selectedAppearance: String?

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("home", systemImage: "house.fill")
                }
                .tag(0)
            
            SettingsView()
                .tabItem {
                    Label("settings", systemImage: "gearshape.fill")
                }
                .tag(1)
        }
        .environment(\.locale, selectedLanguage != nil ? .init(identifier: selectedLanguage!) : .current)
        .preferredColorScheme(getAppearance())
    }

    private func getAppearance() -> ColorScheme? {
        switch selectedAppearance {
        case "dark": return .dark
        case "light": return .light
        default: return nil
        }
    }
}