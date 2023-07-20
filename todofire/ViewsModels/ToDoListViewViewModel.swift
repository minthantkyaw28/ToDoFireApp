//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation
import FirebaseFirestore

///View Model for list of items view
///Primary tab
class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userID : String
    
    init(userID:String){
        self.userID=userID
    }
    
    ///delete todo list item
    func delete(id:String){
        
        let db=Firestore.firestore()
        
        db.collection("users").document(userID).collection("todos").document(id).delete()
    }
    
}
