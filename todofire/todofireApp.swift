//
//  todofireApp.swift
//  todofire
//
//  Created by MTK on 14/07/2023.
//

import SwiftUI
import FirebaseCore

@main
struct todofireApp: App {
    
    //Initialize firebase in app
    //using GoogleService-info file
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
