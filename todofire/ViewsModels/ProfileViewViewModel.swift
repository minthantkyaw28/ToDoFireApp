//
//  ProfileViewViewModel.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel : ObservableObject {
    
    init(){}
    
    @Published var user: User? = nil
    
   
   
    //fetch user data
    func fetchUser(){
        guard let userID=Auth.auth().currentUser?.uid else{
            return
        }
        let db=Firestore.firestore()
        db.collection("users").document(userID).getDocument{ [weak self] snapshot,error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async{
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
            
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
    
  
    
    
   
}
