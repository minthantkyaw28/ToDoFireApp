//
//  TLButtton.swift
//  todofire
//
//  Created by MTK on 14/07/2023.
//

import SwiftUI

struct TLButtton: View {
    
    let title: String
    let backgroud: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            //Attempt to login
            //Actions
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroud)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        
    }
}

struct TLButtton_Previews: PreviewProvider {
    static var previews: some View {
        TLButtton(title: "Button",backgroud: .blue){
            //action
            
        }
    }
}
