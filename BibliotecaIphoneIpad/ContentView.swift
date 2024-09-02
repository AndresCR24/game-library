//
//  ContentView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var loginShow: FirebaseViewModel
    
    var body: some View {
        return Group {
            if loginShow.show {
                Home()
                    .ignoresSafeArea(.all)
//                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            } else {
                Login()
//                    .preferredColorScheme(.light)
            }
        }
        .onAppear() {
            if (UserDefaults.standard.object(forKey: "sesion")) != nil {
                loginShow.show.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(FirebaseViewModel())
}
