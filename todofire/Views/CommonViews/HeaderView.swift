//
//  HeaderView.swift
//  ToDo
//
//  Created by MTK on 14/07/2023.
//

import SwiftUI

struct HeaderView: View {
    
    //arguments to take in
    //to make the view reusable
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
            .padding(.top,80)
        }
        .frame(width:UIScreen.main.bounds.width*3,
               height: 350)
        .offset(y:-150)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .green)
    }
}
