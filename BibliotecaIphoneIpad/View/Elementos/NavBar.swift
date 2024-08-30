//
//  NavBar.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct NavBar: View {
    
    var device = UIDevice.current.userInterfaceIdiom
    @Binding var index: String // Se colocan binding ya que el navbar no es una vista como tal
    @Binding var menu: Bool// si no que se utilizara en el home y se envia ese binding al home
    
    var body: some View {
        HStack {
            Text("My Games")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .font(.system(size: device == .phone ? 25 : 35))
            Spacer()
            
            if device == .pad {
                // Menu para ipad
                HStack(spacing: 25) {
                    ButtonView(index: $index, menu: $menu, title: "Playstation")
                    ButtonView(index: $index, menu: $menu, title: "Xbox")
                    ButtonView(index: $index, menu: $menu, title: "Nintendo")
                }
            } else {
                // Menu para Iphone
                Button(action: {
                    withAnimation() {
                        menu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 26))
                        .foregroundStyle(.white)
                }

            }
        }
        .padding(.top, 30)
        .padding()
        .background(Color.purple)
        //.ignoresSafeArea()
    }
}


//#Preview {
//    NavBar()
//}
