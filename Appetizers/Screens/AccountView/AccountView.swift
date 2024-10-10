//
//  AccountView.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI


struct AccountView: View {
    
    @State private var vm = AccountViewModel()
    

    
    var body : some View{
        NavigationView{
            Form{
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $vm.user.firstName)
                    TextField("Last Name", text: $vm.user.lastName)
                    TextField("Email", text: $vm.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    DatePicker("Birthday", selection: $vm.user.dob,displayedComponents: .date)
                    Button{
                        vm.saveChanges()
                    } label : {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $vm.user.isNapkins)
                    Toggle("Frequent Refills", isOn: $vm.user.isRefill)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            
            .navigationTitle("Account")
        }
        .onAppear{
            vm.retrieveData()
        }
        .alert(item: $vm.alertItem) { (alertItem) in
            Alert(title: alertItem.title,message: alertItem.message,dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
