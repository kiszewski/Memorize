//
//  MemoryGame.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 28/06/22.
//

import Foundation

struct MemoryGame<Element> {
    
    init(numberOfPairOfCards: Int, onGenerateCard: (Int) -> Element) {
        cards = []
        
        for index in 0..<numberOfPairOfCards {
            cards.append(Card(id: index * 2 + 1, content: onGenerateCard(index) ))
            cards.append(Card(id: index * 2 + 2, content: onGenerateCard(index) ))
        }
        
        cards.shuffle()
    }
    
    var cards: Array<Card>
    
    mutating func choose(item: Card) {
        print("Choose: \(item.id)")
        let index: Int? = cards.firstIndex(of: item)
        
        if(index != nil) {
            cards[index!].isFaceUp = !cards[index!].isFaceUp
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        let content: Element
        var isFaceUp: Bool = true
    }
}
