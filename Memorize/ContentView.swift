//
//  ContentView.swift
//  Shared
//
//  Created by Leonardo Kiszewski on 26/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) {
                index in CardView(isFaceUp: true)
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
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if(isFaceUp) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius:8)
                    .fill(Color.white)
                Text("👻").font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius:8)
            }
        }.foregroundColor(Color.orange)
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
