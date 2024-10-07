//
//  AppetizerListItem.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

struct AppetizerListItem : View {
    var appetizer:Appetizer
    var body : some View {
        HStack(spacing:20){
            Image("beef-steak")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120,height: 90)
                .cornerRadius(8)
                .clipped()
            VStack(alignment:.leading){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerListItem(appetizer: MockData.sampleAppetizer)
}
