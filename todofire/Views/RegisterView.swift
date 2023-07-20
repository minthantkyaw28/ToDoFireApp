//
//  RegisterView.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import SwiftUI

struct RegisterView: View {
    
    //object instantiation of viewmodel
    @StateObject var ViewModel=RegisterViewViewModel()
    
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
            
            Form {
                
                //error msg show
                //                if !ViewModel.errorMessage.isEmpty{
                //                    Text(ViewModel.errorMessage)
                //                        .foregroundColor(Color.red)
                //                }
                
                TextField("Name", text:$ViewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text:$ViewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text:$ViewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Register Button
                TLButtton(
                    title: "Register",
                    backgroud: .blue
                ) {
                    //attempt register
                    ViewModel.register()
                }
                .padding()
                
            }
            .offset(y:-50)
        
            
            Spacer()
            
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
