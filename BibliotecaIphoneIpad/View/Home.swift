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
    @Environment(\.horizontalSizeClass) var width
    
    var device = UIDevice.current.userInterfaceIdiom
    
    
    var body: some View {
        ZStack() {
            VStack() {
                NavBar(index: $index, menu: $menu)
                ZStack {
                    if index == "Playstation" {
                        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: getColumns()), spacing: 20){
                                
                                ForEach(1...9, id:\.self) { _ in
                                    CardView()
                                        .padding(.all)
                                }
                            }
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
                    .frame(width: widthMenu - 150)
                    .background(Color.purple)
                }
            }
        }
        .background(Color.white.opacity(0.9))
    }
    
    func getColumns() -> Int {
        return (device == .pad) ? 3 : ((device == .phone && width == .regular) ? 3 : 1)
    }
}



#Preview {
    Home()
}
