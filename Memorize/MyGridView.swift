//
//  MyGridView.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 09/07/22.
//

import SwiftUI

struct MyGridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: Array<Item>
    
    var onBuild: (Item) -> ItemView
    
    var body: some View {
        GeometryReader() { geometry in
            body(for: GridLayout(columns: 2, size: geometry.size, itemCount: items.count))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            let index = items.firstIndex(of: item)
            
            onBuild(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.itemPosition(itemAtIndex: index ?? 0))
        }
    }
}


struct GridLayout {
    var size: CGSize
    var itemCount: Int
    
    var columns: Int = 2
    var rows: Int { Int(itemCount / columns) }
    
    init(columns: Int, size: CGSize, itemCount: Int) {
        self.columns = columns
        self.size = size
        self.itemCount = itemCount
    }
    
    var itemSize: CGSize { CGSize(width: size.width / 2, height: size.height / 4) }
    
    func itemPosition(itemAtIndex: Int) -> CGPoint {
        let itemWidth = Double(size.width / 2)
        let itemHeight = Double(size.height / 4)
        
        var row = 0.0
        var column = 0.0
        
        row = Double((itemAtIndex * columns) / rows)
        
        var y = Double(row) * itemHeight
        y = y + (itemHeight / 2)
        
        column = Double((itemAtIndex * columns) % rows)
        var x = column > 0.5 ? 1.5 : 0.5
        
        x = x * itemWidth
        
        print("X: \(x) Y: \(y) ")
        return CGPoint(x: x, y: y)
    }

}
