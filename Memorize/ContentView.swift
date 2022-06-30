//
//  ContentView.swift
//  Shared
//
//  Created by Leonardo Kiszewski on 26/06/22.
//

import SwiftUI

struct ContentView: View {
    var emojiGame: EmojiMemoryGame
    
    var columns: [GridItem] =
    Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(emojiGame.cards) {
                card in CardView(card: card).onTapGesture {
                    emojiGame.choose(card: card)
                }
            }
        }.padding()
        
//        Same:
//        HStack (content: {
//            ForEach(0..<4, content:  {
//                index in CardView(isFaceUp: true)
//            })
//        }).padding()
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
        ContentView(emojiGame: EmojiMemoryGame())
    }
}
