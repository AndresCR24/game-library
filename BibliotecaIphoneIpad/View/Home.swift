//
//  Home.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct Home: View {
    @State private var index = "Playstation"
    @State private var menu = false
    @State private var widthMenu = UIScreen.main.bounds.width
    
    
    
    var body: some View {
        ZStack() {
            VStack() {
                NavBar(index: $index, menu: $menu)
                ZStack {
                    if index == "Playstation" {
                        Color.blue
                        ListView(plataforma: "Playstation")
                        
                    } else if index == "Xbox" {
                        
                        Color.green
                        ListView(plataforma: "Xbox")
                        
                    } else if index == "Nintendo" {
                        
                        Color.fondoNintendo
                        ListView(plataforma: "Nintendo")
                        
                    } else {
                        AddView()
                    }
                }
            }
            // Termina el navbar del ipad
            if menu {
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation() {
                                    menu.toggle()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundStyle(.white)
                            }
                            
                        }
                        .padding()
                        .padding(.top, 50)
                        VStack(alignment: .trailing) {
                            ButtonView(index: $index, menu: $menu, title: "Playstation")
                            ButtonView(index: $index, menu: $menu, title: "Xbox")
                            ButtonView(index: $index, menu: $menu, title: "Nintendo")
                        }
                        Spacer()
                    }
                    .frame(width: widthMenu - 150)
                    .background(Color.purple)
                }
            }
        }
        //.background(Color.white.opacity(0.9))
        .background(Color("fondo"))
    }
    
    
}



//#Preview {
//    Home()
//}
