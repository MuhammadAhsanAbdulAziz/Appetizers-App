//
//  UserModel.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var dob = Date()
    var isNapkins = false
    var isRefill = false
}
