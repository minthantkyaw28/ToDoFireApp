//
//  ToDoListItemView.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var ViewModel = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.body).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                //delete data
                ViewModel.toggleIsDone(item:item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
            
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        
        ToDoListItemView(item: .init(
            id: "123",
            title: "Buy Milk",
            dueDate:Date().timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        ))
        
    }
}