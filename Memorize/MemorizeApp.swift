//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 26/06/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(emojiGame: game )
        }
    }
}
