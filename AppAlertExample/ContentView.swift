//
// Created for AppAlertExample
// by  Stewart Lynch on 2023-11-22
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct ContentView: View {
    @State private var alertService = AlertService("https://stewartlynchdemo.github.io/AppAlert/messages.json")
    var body: some View {
        NavigationStack {
            VStack {
                Image(.greetings)
                    .resizable()
                    .scaledToFit()
                    .padding()
                if alertService.showMessage == false {
                    Text("You are up to date")
                }
            }
            .navigationTitle("Dynamic Alerts")
        }
        .messageAlert(alertService)
        .task {
            await alertService.showAlertIfNecessary()
        }
    }
}

#Preview {
    ContentView()
}
