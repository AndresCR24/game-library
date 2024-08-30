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
    
    var body: some View {
        ZStack() {
            VStack() {
                NavBar(index: $index, menu: $menu)
                ZStack {
                    if index == "Playstation" {
                        VStack{
                            Color.blue
                        }
                    } else if index == "Xbox" {
                        VStack{
                            Color.green
                        }
                    } else {
                        VStack{
                            Color.red
                        }
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
                    .background(Color.purple)
                }
            }
        }
    }
}

#Preview {
    Home()
}
