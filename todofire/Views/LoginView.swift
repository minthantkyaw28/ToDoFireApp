//
//  LoginView.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import SwiftUI

struct LoginView: View {
    
    //state
    @StateObject var ViewModel=LoginViewViewModel()
    
    var body: some View {
      
        NavigationView{
            
            VStack{
                
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .green)
                
               
                //Login Form
                Form{
                    
                    //error msg show
                    if !ViewModel.errorMessage.isEmpty{
                        Text(ViewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text:$ViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text:$ViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    //login button
                    TLButtton(
                        title: "Login",
                        backgroud: .blue
                    ) {
                        //attempt login
                        ViewModel.login()
                    }
                    .padding(2)
                    
                }
                .offset(y:-50)
                
                //Create Account
                VStack{
                    Text("New around here!")
                    NavigationLink("Create an account",destination:RegisterView())
                }
                .padding(.bottom,50)
                
                
                Spacer()
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
