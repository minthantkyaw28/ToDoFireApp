//
//  NewItemView.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import SwiftUI

struct NewItemView: View {
    
    //State by ViewModel
    @StateObject var ViewModel = NewItemViewViewModel()
    
    //for save btn
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top,100)
            
            Form{
                //Title
                TextField("Title",text: $ViewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date",selection: $ViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //BUtton
                TLButtton(title: "Save", backgroud: .pink){
                    if ViewModel.canSave {
                        ViewModel.save()
                        newItemPresented = false
                    }else{
                        ViewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $ViewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer") )
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set:{ _ in
            
        }))
    }

}
