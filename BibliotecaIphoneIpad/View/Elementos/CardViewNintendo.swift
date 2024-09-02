//
//  CardView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct CardViewNintendo: View {
    var titulo: String
    var portada: String
    var index: FirebaseModel
    var plataforma: String
    
    @StateObject var datos = FirebaseViewModel()
    
    //var plataforma: String
    
    var body: some View {
        VStack(spacing: 20) {
            
            ImagenFirebase(imageUrl: portada)

            Text(titulo)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundStyle(.black)
            
            Button(action: {
                datos.delete(index: index, plataforma: plataforma)
            }) {
                Label(
                    title: { Text("Eliminar") },
                    icon: { Image(systemName: "trash") }
                )
                .foregroundStyle(.black)
                .padding(.vertical, 5)
                .padding(.horizontal, 25)
                .background(Capsule().stroke(Color.black))
                
            }

        }
        .padding()
        .background(Color.nintendo)
        .clipShape(.rect(cornerRadius: 20))
    }
}

//#Preview {
//    CardView()
//}
