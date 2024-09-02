//
//  AddView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI
import PhotosUI

struct EditarView: View {
    
    @State private var titulo = ""
    @State private var descripcion = ""
    
    var plataforma = "Playstation"
    var datos: FirebaseModel
    
    @StateObject var guardar = FirebaseViewModel()
    
    @State private var imagenData: Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source: UIImagePickerController.SourceType = .camera
    @State private var progress = false
    
    @Environment(\.dismiss) var dismissMode
    //@State private var source
    
    var body: some View {
        //Inicio NavigationStack
        NavigationStack() {
            //Inicio Zstack
            ZStack() {
                Color.yellow.ignoresSafeArea()
                // Inicio Vstack
                VStack() {
                    TextField("Titulo", text: $titulo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onAppear {
                            titulo = datos.titulo
                        }
                    TextEditor(text: $descripcion)
                        .frame(height: 200)
                        .onAppear {
                            descripcion = datos.descripcion
                        }
                    
                    Button(action: {
                        mostrarMenu.toggle()
                    }) {
                        Text("Cargar imagen")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.largeTitle)
                    }
                    .actionSheet(isPresented: $mostrarMenu, content: {
                        ActionSheet(title: Text("Menu"), message: Text("Selecciona una opcion"), buttons: [
                            .default(Text("Camara"), action: {
                                source = .camera
                                imagePicker.toggle()
                            }),
                            .default(Text("Galeria"), action: {
                                source = .photoLibrary
                                imagePicker.toggle()
                            }),
                            .default(Text("Cancelar"))
                        ])
                    })
                    .sheet(isPresented: $imagePicker) {
                        ImagePicker(show: $imagePicker, image: $imagenData, source: source)
                    }
                    
                    if imagenData.count != 0 {
                        Image(uiImage: UIImage(data: imagenData)!)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                    
                    Button(action: {
                        if imagenData.isEmpty {
                            guardar.edit(titulo: titulo, descripcion: descripcion, plataforma: plataforma, id: datos.id) { done in
                                if done {
                                    dismissMode()
                                }
                            }
                        } else {
                            progress = true
                            guardar.editWithImage(titulo: titulo, descripcion: descripcion, plataforma: plataforma, id: datos.id,
                                                  index: datos, portada: imagenData) { done in
                                if done {
                                    dismissMode()
                                }
                            }
                        }
                    }) {
                        Text("Editar")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.largeTitle)
                    }
                    
                    if progress {
                        Text("Cargando, espera un momento")
                            .foregroundStyle(.black)
                        ProgressView()
                    }
                    
                    Spacer()
                }
                //Fin Vstack
                .padding()
            }
            //Fin Zstack
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            print(datos)
        }
        //Fin NavigationStack
    }
}


//#Preview {
//    AddView()
//}
