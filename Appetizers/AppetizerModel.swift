//
//  Appeztizer.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import Foundation

// MARK: - Appetizer
struct AppetizerResponse : Decodable {
    let request: [Appetizer]
}

// MARK: - Request
struct Appetizer: Decodable, Identifiable {
    let carbs, calories, protein: Int
    let description: String
    let price: Double
    let imageURL: String
    let name: String
    let id: Int
}

struct MockData {
    static let sampleAppetizer = Appetizer(carbs: 12, calories: 11, protein: 33, description: "This is the descrption", price: 5, imageURL: "", name: "Test Appetizer", id: 1)
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}


