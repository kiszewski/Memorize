//
//  MemoryGameView.swift
//  Shared
//
//  Created by Leonardo Kiszewski on 26/06/22.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    var body: some View {
        VStack {
            MyGridView(items: emojiGame.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation {
                        if(!card.isMatched) {
                            emojiGame.choose(card: card)
                        }
                    }
                }.padding()
            }
            Button(
                action: {
                    withAnimation {
                        emojiGame.restart()
                    }
            },
                label: { Text("Reiniciar") })
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        Text(card.content)
            .font(card.isMatched ? Font.largeTitle : Font.title3)
            .cardify(isFacedUp: card.isFaceUp)
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(emojiGame: EmojiMemoryGame())
    }
}
