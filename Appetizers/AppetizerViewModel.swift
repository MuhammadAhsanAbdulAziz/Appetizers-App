//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

final class AppetizerViewModel : ObservableObject{
    
    @Published var appetizersList : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading : Bool = false
    
    init() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async{ [self] in
                isLoading = false
                switch result{
                case .success(let appetizers):
                    appetizersList =  appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidUrl
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                    
                }
            }
        }
    }
    
}
