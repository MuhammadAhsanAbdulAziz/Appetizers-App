//
//  ContentView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var orderList: Order
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem{
                    Label("Home",systemImage: "house.fill")
                }
            AccountView()
                .tabItem{
                    Label("Account",systemImage: "person.fill")
                }
            OrderView()
                .tabItem{
                    Label("Order",systemImage: "bag.fill")
                }
                .badge(orderList.items.count)
        }
        .tint(Color("BrandPrimary"))
        
    }
}

#Preview {
    AppetizerTabView()
}
