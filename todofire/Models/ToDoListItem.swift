//
//  ToDoListItem.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation

struct ToDoListItem : Codable,Identifiable{
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool){
        isDone=state
    }
}
