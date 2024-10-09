//
//  OrderView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//
import SwiftUI


struct OrderView: View {
    var body : some View{
        NavigationView{
            VStack{
                List{
                    ForEach(MockData.appetizers) { (appetizer) in
                        AppetizerListItem(appetizer: appetizer)
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Place Order")
                        .foregroundColor(.white)  // Use foregroundColor for text color
                        .frame(maxWidth: .infinity, minHeight: 50)  // Set width and height
                    
                }
                .background(Color.brandPrimary)  // Background color applied to the entire frame
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.bottom,20)
                
            }
            .navigationTitle("Order")
            
        }
        
    }
}

#Preview {
    OrderView()
}
