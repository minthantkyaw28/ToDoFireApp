//
//  ProfileView.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import SwiftUI

struct ProfileView: View {
    
    //state by ViewModel
    @StateObject var ViewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = ViewModel.user{
                    
                    profile(user: user)
                    
                    Spacer()
                }else{
                    Text("Loading Profile ...")
                }
                
            }
            .navigationTitle("Profile")
        }.onAppear{
            ViewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user : User) -> some View{
        
       
        //Avater
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width:125,height: 123)
            .padding(10)
        
        //Info : Name,Email, Member Since
        VStack(alignment: .leading){
            HStack{
                Text("Name : ").bold()
                Text(user.name)
            }.padding()
            
            HStack{
                Text("Email : ").bold()
                Text(user.email)
            }.padding()
            
            HStack{
                Text("Member Since :").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
        
        //change password
        
        NavigationLink("Change Password", destination: ChangePasswordView())
        .padding(20)
        .tint(.red)
        
        //Logout
        Button("Log Out"){
            ViewModel.logout()
        }
        .padding(20)
        .tint(.red)
            
        //delete account
        
        
          
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }

