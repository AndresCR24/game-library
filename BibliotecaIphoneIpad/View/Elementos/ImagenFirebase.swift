//
//  ImagenFirebase.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 1/09/24.
//

import SwiftUI

struct ImagenFirebase: View {
    
    let imagenAlternativa = UIImage(systemName: "photo")
    @ObservedObject var imageLoader: PortadaViewModel
    
    init(imageUrl: String) {
        imageLoader = PortadaViewModel(imageUrl: imageUrl)
    }
    
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        
        Image(uiImage: image ?? imagenAlternativa!)
            .resizable()
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 5)
            .aspectRatio(contentMode: .fit)
    }
    
    
}

//#Preview {
//    ImagenFirebase()
//}
