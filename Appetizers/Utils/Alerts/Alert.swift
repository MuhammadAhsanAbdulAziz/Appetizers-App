//
//  Alert.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

struct AlertItem : Identifiable{
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
    
    
}
    
    struct AlertContext{
        static let invalidData = AlertItem(title: Text("Server Error"), message: Text ("Data recieved from the server is invalid"), dismissButton: .default(Text("OK")))
        
        static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
        
        static let invalidUrl = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
        
        static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
        
        
        static let incompleteForm = AlertItem(title: Text("Incomplete Form"), message: Text ("Please fill the form"), dismissButton: .default(Text("OK")))
        
        static let incorrectEmail = AlertItem(title: Text("Email Incorrect"), message: Text ("Please write a valid email address"), dismissButton: .default(Text("OK")))
        
        static let savedData = AlertItem(title: Text("Profile Saved"), message: Text ("Profile information saved successfully"), dismissButton: .default(Text("OK")))
        
        static let errorData = AlertItem(title: Text("Profile Error"), message: Text ("There was an error retrieving the data"), dismissButton: .default(Text("OK")))
    
}
