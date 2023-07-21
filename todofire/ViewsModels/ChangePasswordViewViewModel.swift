//
//  ChangePasswordViewViewModel.swift
//  todofire
//
//  Created by MTK on 19/07/2023.
//

import Foundation
import FirebaseAuth


class ChangePasswwordViewViewModel : ObservableObject {
    
    @Published var showAlert = false
    
    @Published var password : String = ""
    @Published var confirmPassword : String = ""

    
    //password change func
    func changePassword(){
        //fetch user data and change password and logout
        Auth.auth().currentUser?.updatePassword(to: password) { error in
            self.logout() //log out after password changes
        }
    }
    
    //log out
    func logout(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
    
    //validate password data
    var canSave: Bool{
        guard !password.trimmingCharacters (in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !confirmPassword.trimmingCharacters (in: .whitespaces).isEmpty else {
            return false
        }
     
        guard password == confirmPassword else{
            showAlert=true
            return false
        }

        return true
    }
    
}
