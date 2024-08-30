//
//  ButtonView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var index: String // para dirigirnos a diferentes secciones de la app
    @Binding var menu: Bool  // abrir un menu desplegable de lado
    var title: String // por que sera parametro
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                index = title
            }
        }) {
            Text(title)
                .font(.title)
                .fontWeight(index == title ? .bold : .none)//Operador ternario para poner en negritas el botn si se da click (if en 1 lin)
                .foregroundStyle(index == title ? .white : Color.white.opacity(0.6)) // es un if else en una sola linea de codigo
        }
    }
        
}


#Preview {
    // Proporcionar valores predeterminados para la vista previa
    ButtonView(index: .constant("Inicio"), menu: .constant(false), title: "Inicio")
}
