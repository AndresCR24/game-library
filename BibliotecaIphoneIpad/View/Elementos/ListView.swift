//
//  ListView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 1/09/24.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.horizontalSizeClass) var width
    
    @StateObject var datos = FirebaseViewModel()
    //@State private var showEditar = false
    var device = UIDevice.current.userInterfaceIdiom
    var plataforma: String
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: getColumns()), spacing: 20){
                
                ForEach(datos.datos) { item in
                    if plataforma == "Playstation" {
                        CardView(titulo: item.titulo, portada: item.portada, index: item, plataforma: plataforma)
                            .onTapGesture {
                                datos.sendData(item: item)
                            }
                            .sheet(isPresented: $datos.showEditar, content: {
                                EditarView(plataforma: plataforma, datos: datos.itemUpdate)
                            })
                            .padding(.all)
                    } else if plataforma == "Xbox"{
                        CardViewXbox(titulo: item.titulo, portada: item.portada, index: item, plataforma: plataforma)
                            .onTapGesture {
                                datos.sendData(item: item)
                            }
                            .sheet(isPresented: $datos.showEditar, content: {
                                EditarView(plataforma: plataforma, datos: datos.itemUpdate)
                            })
                            .padding(.all)
                    } else {
                        CardViewNintendo(titulo: item.titulo, portada: item.portada, index: item, plataforma: plataforma)
                            .onTapGesture {
                                datos.sendData(item: item)
                            }
                            .sheet(isPresented: $datos.showEditar, content: {
                                EditarView(plataforma: plataforma, datos: datos.itemUpdate)
                            })
                            .padding(.all)
                    }
                    
                    
                    
                    
                }
            }
        }
        .onAppear {
            datos.getData(plataforma: plataforma)
        }
    }
    
    func getColumns() -> Int {
        return (device == .pad) ? 3 : ((device == .phone && width == .regular) ? 3 : 1)
    }
}


//    var body: some View {
//        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
//
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: getColumns()), spacing: 20){
//
//                ForEach(datos.datos) { item in
//                    CardView(titulo: item.titulo, portada: item.portada)
//                        .padding(.all)
//                }
//            }
//        }
//        .onAppear {
//            datos.getData(plataforma: plataforma)
//        }
//    }
//
//    func getColumns() -> Int {
//        return (device == .pad) ? 3 : ((device == .phone && width == .regular) ? 3 : 1)
//    }
//}

//#Preview {
//    ListView()
//}
