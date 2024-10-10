//
//  EmptyState.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import SwiftUI

struct EmptyState: View {
    
    var image : String
    var text : String
    
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 300)
            Text(text)
                .font(.system(size: 20))
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    EmptyState(image: "empty-order", text: "You have no items in your order")
}
