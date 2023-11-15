//
// Created for AppAlertExample
// by  Stewart Lynch on 2023-11-15
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import Foundation

enum MessageService {
    struct Message: Codable {
        var id: Int
        var title: String
        var text: String
        var url: String
    }
    static var cacheLocation = URL.cachesDirectory.path()
    static var userDefaultsLocation = URL.libraryDirectory.appending(path: "Preferences").path()
    
    static var url = "https://stewartlynch.github.io/AppAlert/alert.json"
    static var message = Message(id: 0, title: "Failed", text: "Failed to retrieve Message", url: "")
    static var lastMessageId: Int {
        get {
            UserDefaults.standard.integer(forKey: "lastMessageId")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "lastMessageId")
        }
    }
    static func fetchMessage() async {
        do {
            let (data, _) = try  await URLSession.shared.data(from: URL(string: self.url)!)
            message = try JSONDecoder().decode(Message.self, from: data)
        } catch {
            print("Could not decode")
        }
    }
    static func toggleAlert(showMessage: inout Bool) async {
        await fetchMessage()
        if message.id > lastMessageId {
            showMessage.toggle()
        }
        lastMessageId = message.id
    }
}
