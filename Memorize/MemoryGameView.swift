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
        MyGridView(items: emojiGame.cards) { card in
            CardView(card: card).onTapGesture {
                emojiGame.choose(card: card)
                   
            }
            .padding()
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if(card.isFaceUp) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius:8)
                    .fill(Color.white)
                Text(card.content).font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius:8)
            }
        }
        .foregroundColor(Color.orange)
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(emojiGame: EmojiMemoryGame())
    }
}
