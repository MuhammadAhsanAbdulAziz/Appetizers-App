//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import Foundation
import SwiftUI

@Observable class AccountViewModel {
    
    @ObservationIgnored @AppStorage("user")  var userData : Data?
     var user = User()
     var alertItem : AlertItem?
    
    var isFormValid: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.incompleteForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.incorrectEmail
            return false
        }
        
        
        return true
    }
    
    func saveChanges(){
        guard isFormValid else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.savedData
        } catch{
            alertItem = AlertContext.errorData
        }
    }
    
    func retrieveData(){
        guard let user = userData else {return}
        
        do{
            let data = try JSONDecoder().decode(User.self, from: user)
            self.user = data
        } catch{
            alertItem = AlertContext.errorData
        }
    }
    
}
