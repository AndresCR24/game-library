//
//  CardView.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Image("gowRagnarok")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("gowRagnarok")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundStyle(.black)
        }
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 20))
    }
}

//#Preview {
//    CardView()
//}
