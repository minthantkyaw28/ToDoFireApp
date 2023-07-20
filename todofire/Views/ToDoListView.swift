//
//  ToDoListView.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    //state by ViewModel
    @StateObject var ViewModel : ToDoListViewViewModel
    
    //data query
    @FirestoreQuery var items: [ToDoListItem]
    
    //private let userID: String
    
    init(userID: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/todos"
        )
        
        //sending data to ViewModel
        self._ViewModel=StateObject(wrappedValue: ToDoListViewViewModel(userID:userID))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item:item).swipeActions{
                            Button{
                                //Delete
                                ViewModel.delete(id: item.id)
                            } label: {
                                Text("Delete").tint(.red)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Todo")
            .toolbar{
                Button{
                    //Action#add todo
                    ViewModel.showingNewItemView=true
                    
                }label:{
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $ViewModel.showingNewItemView){
                NewItemView(newItemPresented: $ViewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "0Q3aSpObzxSjeJXOW4POPM5AFL72")
    }
}
