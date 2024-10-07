//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI


struct AppetizerListView: View {
    
    @State private var appetizersList : [Appetizer] = []
    
    var body : some View{
        NavigationView{
            List(appetizersList){appetizer in
                AppetizerListItem(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
        .onAppear{
            getAppetizers()
        }
        
        
    }
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers { (result) in
            DispatchQueue.main.async{
                switch result{
                case .success(let appetizers):
                    appetizersList = appetizers
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}

#Preview {
    AppetizerListView()
}
