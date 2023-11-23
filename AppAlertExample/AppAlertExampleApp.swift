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

@main
struct AppAlertExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(AlertService.appVersion)
                    print(AlertService.osVersion)
                    print(AlertService.cachesLocation.path())
                    print(AlertService.userDefaultsLocation.path())
                }
        }
    }
}
