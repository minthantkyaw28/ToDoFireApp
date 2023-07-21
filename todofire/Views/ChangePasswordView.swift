//
//  ChangePasswordView.swift
//  todofire
//
//  Created by MTK on 19/07/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    
    //State by ViewModel
    @StateObject var ViewModel = ChangePasswwordViewViewModel()
    
 
    
    var body: some View {
        VStack{
            Text("Change Password")
                .font(.system(size:32))
                .bold()
                .padding(.top,100)
            
            Form{
                //new password
                SecureField("New Password",text:$ViewModel.password)
                
                //confirm password
                SecureField("Confirm Password",text:$ViewModel.confirmPassword)

                
                //Change Password Button
                TLButtton(title: "Save", backgroud: .pink){
                    if ViewModel.canSave {
                        ViewModel.changePassword()
                    }
                    else{
                        ViewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $ViewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in correct new password") )
            }
        
    }
    }
    
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
