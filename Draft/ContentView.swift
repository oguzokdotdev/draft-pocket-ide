import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "terminal.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.tint)
                
                Text("Draft IDE")
                    .font(.largeTitle.bold())
                
                Text("Ready to build the future.")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("Draft")
        }
    }
}

#Preview {
    ContentView()
}