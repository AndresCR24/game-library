//
//  FirebaseViewModel.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import Foundation
import Firebase
import FirebaseAuth


class FirebaseViewModel: ObservableObject {
    
    @Published var show = false
    
    func login(email: String, password: String, completion: @escaping (_ done: Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if user != nil {
                print("Entro")
                completion(true)
            } else {
                if let error = error?.localizedDescription{
                    print("Error en firebase \(error)")
                }else {
                    print("Error en la app")
                }
                    
            }
        }
    }
}
