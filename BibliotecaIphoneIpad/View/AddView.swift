//
//  AddView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI
import PhotosUI
struct AddView: View {
    
    @State private var titulo = ""
    @State private var descripcion = ""
    var consolas = ["Playstation", "Xbox", "Nintendo"]
    @State private var plataforma = "Playstation"
    @StateObject var guardar = FirebaseViewModel()
    
    @State private var imagenData: Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source: UIImagePickerController.SourceType = .camera
    //@State private var source
    
    var body: some View {
        //Inicio NavigationStack
        NavigationStack() {
            //Inicio Zstack
            ZStack() {
                Color.yellow.ignoresSafeArea()
                // Inicio Vstack
                VStack() {
                    //Este metodo se cambio por el .NavigationDestination al final del NavigationStack
//                    NavigationLink(isActive: $imagePicker) {
//                        ImagePicker(show: $imagePicker, image: $imagenData, source: source)
//                    } label: {
//                        EmptyView()
//                    }
//
//                    .toolbar(.hidden)
                    TextField("Titulo", text: $titulo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextEditor(text: $descripcion)
                        .frame(height: 200)
                    Picker("Consolas", selection: $plataforma) {
                        
                        ForEach(consolas, id: \.self) {item in
                            Text(item)
                                .foregroundStyle(.black)
                        }
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
                            .default(Text("camara"), action: {
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
                        
                        Button(action: {
                            guardar.save(titulo: titulo, descripcion: descripcion, plataforma: plataforma, portada: imagenData) { done in
                                if done {
                                    titulo = ""
                                    descripcion = ""
                                    imagenData = .init(capacity: 0)
                                }
                            }
                        }) {
                            Text("Guardar")
                                .foregroundStyle(.black)
                                .bold()
                                .font(.largeTitle)
                        }
                    }
           
                   
                    Spacer()
                }
                //Fin Vstack
                .padding()
            }
            //Fin Zstack
            
        }
        //Fin navigationStack
//        .navigationDestination(isPresented: $imagePicker) {
//            ImagePicker(show: $imagePicker, image: $imagenData, source: source)
//        }
        //.toolbar(.hidden)
    }
}

//#Preview {
//    AddView()
//}
