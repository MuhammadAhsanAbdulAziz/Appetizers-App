//
//  OrderView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//
import SwiftUI


struct OrderView: View {
    
    @EnvironmentObject var orderList: Order
    
    var body : some View{
        NavigationView{
            ZStack{
                
                if !orderList.items.isEmpty{
                    VStack{
                        List{
                            ForEach(orderList.items) { (appetizer) in
                                AppetizerListItem(appetizer: appetizer)
                            }
                            .onDelete(perform: orderList.delete)
                        }
                        .listStyle(.plain)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("$\(orderList.totalPrice,specifier: "%.2f") - Place Order")
                                .foregroundColor(.white)  // Use foregroundColor for text color
                                .frame(maxWidth: .infinity, minHeight: 50)  // Set width and height
                            
                        }
                        .background(Color.brandPrimary)  // Background color applied to the entire frame
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .padding(.bottom,20)
                        
                    }
                }
                else{
                    EmptyState(image: "empty-order", text: "You have no items in your order")
                }
                
            }
            .navigationTitle("Order")
            
        }
        
    }
}

#Preview {
    OrderView()
}
