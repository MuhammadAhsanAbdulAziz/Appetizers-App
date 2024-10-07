//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI


struct AppetizerListView: View {
    
    @StateObject private var appetizerViewModel = AppetizerViewModel()
    
    
    var body : some View{
        ZStack{
            NavigationView{
                List(appetizerViewModel.appetizersList){appetizer in
                    AppetizerListItem(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
                
            }
            if(appetizerViewModel.isLoading){
                ProgressView() // Default Circular Loader
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2) // Increase the size of the loader
                    .padding()
            }
        }
        .alert(item: $appetizerViewModel.alertItem) { alert in
            Alert(title: alert.title,message: alert.message,dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
