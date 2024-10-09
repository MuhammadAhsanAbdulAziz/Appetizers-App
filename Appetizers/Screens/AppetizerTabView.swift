//
//  ContentView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag.fill")
                    Text("Order")
                }
        }
        .tint(Color("BrandPrimary"))
        
    }
}

#Preview {
    AppetizerTabView()
}
