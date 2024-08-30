//
//  BibliotecaIphoneIpadApp.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

@main
struct BibliotecaIphoneIpadApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        
        let login = FirebaseViewModel()
        
      WindowGroup {
        NavigationStack{
            ContentView().environmentObject(login)
        }
      }
    }
}



