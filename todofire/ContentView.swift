//
//  ContentView.swift
//  todofire
//
//  Created by MTK on 14/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var ViewModel = ContentViewViewModel()
    
    var body: some View {
        if ViewModel.isSignedIn, !ViewModel.currentUserID.isEmpty{
            
            accountView
            
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            //signed in
            ToDoListView(userID:ViewModel.currentUserID)
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
