//
//  RegisterViewViewModel.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var name=""
    @Published var email=""
    @Published var password=""
    @Published var errorMessage=""
    
    init(){}
    
    func register(){
       
        guard validate() else{
            return
        }
        
        //try register
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result,error in
            
            //receive uid from createUser callback
            guard let userID=result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userID)
            
        }
        
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(
            id:id,
            name:name,
            email:email,
            joined:Date().timeIntervalSince1970)
        
        let db=Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        //clear data from fields
        errorMessage=""
        //check if all fields have data
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty,          !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage="Please fill in all fields"
            return false
        }
        //check if email format is valid
        guard (email.contains("@") && email.contains(".")) else{
            errorMessage="Please enter valid email"
            return false
        }
        //check the password lenght
        guard (password.count >= 6) else{
            errorMessage="Password must be at least 6 characters long"
            return false
        }
        
        return true
    }
    
}
