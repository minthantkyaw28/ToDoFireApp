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
//    @Published var newPassword : String = ""
//    @Published var oldPasswordFromUser : String = ""
//    @Published var oldPasswordFromServer : String = ""
    
    //data validate
    func changePassword(){
        guard canSave else{
            return
        }
        
        //fetch user data and change password and logout
        Auth.auth().currentUser?.updatePassword(to: password) { error in
            self.logout()
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
    
    //check if old password is match with user provided old password
//    func checkOldPassword(){
//        Auth.auth().currentUser?.
//    }
    
    
    //validate password data
    var canSave: Bool{
        guard !password.trimmingCharacters (in: .whitespaces).isEmpty else {
            return false
        }
        
//        guard !newPassword.trimmingCharacters (in: .whitespaces).isEmpty else {
//            return false
//        }
//
//        guard !oldPassword.trimmingCharacters (in: .whitespaces).isEmpty else {
//            return false
//        }
        
        return true
    }
    
}
