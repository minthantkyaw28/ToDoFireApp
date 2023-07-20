//
//  ToDoListItemViewViewModel.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

///View Model for single todo list item view
///Each row in item list

class ToDoListItemViewViewModel : ObservableObject {
    init(){}
    
    // to do finish/ not finish state toggle
    func toggleIsDone(item:ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid=Auth.auth().currentUser?.uid else{
            return
        }
        
        let db=Firestore.firestore()
        
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
