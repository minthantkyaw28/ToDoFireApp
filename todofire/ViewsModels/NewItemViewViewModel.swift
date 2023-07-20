//
//  NewItemViewViewModel.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        
        //data validate
        guard canSave else{
            return
        }
        
        //get current user id
        guard let uID=Auth.auth().currentUser?.uid else{
            return
        }
        
        //make id for todo
        let newID=UUID().uuidString
        
        //Create model
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //Add data
        let db=Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters (in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
}
