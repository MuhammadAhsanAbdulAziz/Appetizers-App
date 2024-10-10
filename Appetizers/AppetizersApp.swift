//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var orderList = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(orderList)
        }
    }
}
