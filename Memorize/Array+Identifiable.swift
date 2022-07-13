//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Leonardo Kiszewski on 09/07/22.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(of element: Element) -> Int? {
        for index in 0..<self.count {
            
            if(self[index].id == element.id) {
                return index
            }
        }
        
        return nil
    }
}
