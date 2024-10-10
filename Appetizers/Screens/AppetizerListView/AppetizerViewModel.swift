//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

@MainActor
@Observable class AppetizerViewModel {
    
     var appetizersList : [Appetizer] = []
     var alertItem : AlertItem?
     var isLoading : Bool = false
     var isModalShowing = false
     var selectedAppetizer : Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        Task{
            do{
                appetizersList = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch{
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
    
}
