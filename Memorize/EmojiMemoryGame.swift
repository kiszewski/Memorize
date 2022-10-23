//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 29/06/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject  {
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createGame()
    
    static func createGame() -> MemoryGame<String> {
        
        let emojis: Array<String> = [ "👻", "🕸", "🎃", "💀"]
        
        return MemoryGame<String>(numberOfPairOfCards: emojis.count) { index in
            emojis[index]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> { game.cards }
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(item: card)
    }
    
    func restart() {
        game = EmojiMemoryGame.createGame()
    }
}
