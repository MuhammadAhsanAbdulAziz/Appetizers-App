//
//  OrderModel.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import SwiftUI

final class Order: ObservableObject{
    @Published var items: [Appetizer] = []
    
    var totalPrice : Double{
        items.reduce(0) { partialResult, Appetizer in
            partialResult + Appetizer.price
        }
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func delete(at offset: IndexSet){
        items.remove(atOffsets: offset)
    }
    
    
    
}
