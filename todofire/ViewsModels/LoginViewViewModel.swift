//
//  LoginViewViewModel.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject {
    
    @Published var email=""
    @Published var password=""
    @Published var errorMessage=""
    
    init() {
       
    }
    
    func login(){
       
        guard validate() else{
            return
        }
        
        //try log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        //clear data from fields
        errorMessage=""
        //check if all fields have data
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,          !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage="Please fill in all fields"
            return false
        }
        //check if email format is valid
        guard email.contains("@") && email.contains(".") else{
            errorMessage="Please enter valid email"
            return false
        }
        
        return true
    }
    
}
