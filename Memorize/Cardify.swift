//
//  Cardify.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 20/07/22.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFacedUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if(isFacedUp) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 3)
                RoundedRectangle(cornerRadius:8)
                    .fill(Color.white)
                content
            } else {
                RoundedRectangle(cornerRadius:8)
            }
        }
        .foregroundColor(Color.orange)
    }
}

extension View {
    func cardify(isFacedUp: Bool) -> some View {
        self.modifier(Cardify(isFacedUp: isFacedUp))
    }
}
