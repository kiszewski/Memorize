//
//  MemoryGame.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 28/06/22.
//

import Foundation

struct MemoryGame<Element> where Element: Equatable {
    var selectedCard: Card?
    
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
        let index: Int? = cards.firstIndex(of: item)
        
        if(selectedCard == nil) {
            faceDownCardsNotMatched()
            selectedCard = item
            toggleIsFacedUp(index: index)
        } else {
            toggleIsFacedUp(index: index)
            let indexOfSelected: Int? = cards.firstIndex(of: selectedCard!)
            
            let isSameCard = selectedCard?.content == item.content && selectedCard?.id != item.id
            
            if(isSameCard) {
                markAsMatched(index: index)
                markAsMatched(index: indexOfSelected)
            }

            selectedCard = nil
        }
    }
    
    private mutating func toggleIsFacedUp(index: Int?) {
        if(index != nil) {
            cards[index!].isFaceUp = !cards[index!].isFaceUp
        }
    }
    
    private mutating func markAsMatched(index: Int?) {
        if(index != nil) {
            cards[index!].isMatched = true
        }
    }
    
    private mutating func faceDownCardsNotMatched( ) {
        cards.forEach( { card in
            if(!card.isMatched) {
                let index = cards.firstIndex(of: card)
                
                cards[index!].isFaceUp = false
            }
        })
    }
    
    struct Card: Identifiable {
        var id: Int
        let content: Element
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
