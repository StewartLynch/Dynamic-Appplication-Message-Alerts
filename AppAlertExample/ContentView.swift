//
// Created for AppAlertExample
// by  Stewart Lynch on 2023-11-15
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct ContentView: View {
    @AppStorage("lastMessageId") private var lastMessageId = 0
    @State private var showMessage = false
    @State private var message: Message?
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .alert(message?.text ?? "", isPresented: $showMessage) {
                    Button("OK") {}
                    Link("More information", destination: URL(string: message?.url ?? "")! )
                } message: {
                    Text(message?.text ?? "")
                }
        }
        .task {
            let message = await MessageService.fetchMessage()
            if let id = message?.id {
                if id >= lastMessageId {
                    showMessage = true
                }
                lastMessageId = id
            }
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
