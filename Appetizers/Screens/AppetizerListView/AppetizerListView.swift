//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI


struct AppetizerListView: View {
    
    @State var vm = AppetizerViewModel()
    
    var body : some View{
        ZStack{
            NavigationView{
                List(vm.appetizersList){appetizer in
                    AppetizerListItem(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            vm.selectedAppetizer = appetizer
                            vm.isModalShowing = true
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Appetizers")
                
            }
            .task {
                vm.getAppetizers()
            }
            .blur(radius: vm.isModalShowing ? 20 : 0)
            .disabled(vm.isModalShowing)
            
            if(vm.isModalShowing){
                AppetizerItemDetail(appetizer: vm.selectedAppetizer!,isModalShowing: $vm.isModalShowing)
            }
            
            if(vm.isLoading){
                ProgressView() // Default Circular Loader
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2) // Increase the size of the loader
                    .padding()
            }
        }
        .alert(item: $vm.alertItem) { alert in
            Alert(title: alert.title,message: alert.message,dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
