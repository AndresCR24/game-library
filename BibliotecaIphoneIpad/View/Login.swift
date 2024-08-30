//
//  Login.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var login = FirebaseViewModel()
    @EnvironmentObject var loginShow: FirebaseViewModel
    var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        
        ZStack() {
            Color.purple.ignoresSafeArea()
            VStack() {
                Text("My Games")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .frame(width: device == .pad ? 700 : nil) // da el tamaño en ancho y largo a un texfield
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .frame(width: device == .pad ? 700 : nil)
                    .padding(.bottom, 20)
                
                Button(action: {
                    login.login(email: email, password: password) { done in
                        if done {
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
                    }
                }) {
                    Text("Entrar")
                        .font(.title)
                        .frame(width: 200)
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                    
                }
                .background(
                    Capsule()
                        .stroke(Color.white)
                )

                
            }
            .padding()
        }
    }
}

//#Preview {
//    Login()
//}
