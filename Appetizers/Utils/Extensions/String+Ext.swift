//
//  Color+Ext.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import Foundation

extension String{
    
    var isValidEmail : Bool{
        let emailFormat =  "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}


