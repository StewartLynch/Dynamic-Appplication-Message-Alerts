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
    @State private var showMessage = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .alert(MessageService.message.title, isPresented: $showMessage) {
                    Button("OK") {}
                    if !MessageService.message.url.isEmpty {
                        Link("More information", destination: URL(string: MessageService.message.url)!)
                    }
                } message: {
                    Text(MessageService.message.text)
                }
        }
        .task {
            await MessageService.toggleAlert(showMessage: &showMessage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
