//
//  FirebaseViewModel.swift
//  BibliotecaIphoneIpad
//
//  Created by Andres David Cardenas Ramirez on 30/08/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class FirebaseViewModel: ObservableObject {
    
    @Published var show = false
    @Published var datos = [FirebaseModel]()
    
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
    //Base de datos
    
    //Guardar
    func save(titulo: String, descripcion: String, plataforma: String, portada: Data, completion: @escaping (_ done: Bool) -> Void) {
        
        let storage = Storage.storage().reference()
        let nombrePortada = UUID()
        let directorio = storage.child("imagenes/\(nombrePortada)")
        let metaData = StorageMetadata()
        
        metaData.contentType = "image/png"
        directorio.putData(portada, metadata: metaData) {data, error in
            if error == nil {
                print("Guardo la imagen")
                // Guardar Texto
                let db = Firestore.firestore()
                let id = UUID().uuidString
        
                guard let idUser = Auth.auth().currentUser?.uid else {return}
                guard let email = Auth.auth().currentUser?.email else {return}
                let campos: [String: Any] = ["titilo": titulo, "desc": descripcion, "portada": String(describing: directorio), "idUser": idUser, "email": email]
        
                db.collection(plataforma).document(id).setData(campos) {error in
                    if let error = error?.localizedDescription {
                        print("Error al guardar en firestore \(error)")
                    } else {
                        print("Guardo todo")
                        completion(true)
                    }
                }
                // Termino de guardar texto
            } else {
                if let error = error?.localizedDescription {
                    print("Fallo al subir la imagen en el storage \(error)")
                } else {
                    print("Fallo la app")
                }
            }
        }
        
    }
    
    
    func createUser(email: String, password: String, completion: @escaping (_ done: Bool) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if user != nil {
                print("Entro y se registro en firebase")
                completion(true)
            } else {
                if let error = error?.localizedDescription{
                    print("Error en firebase de registro \(error)")
                }else {
                    print("Error en la app")
                }
                
            }
        }
    }
    
    // Mostrar
    func getData(plataforma: String) {
        let db = Firestore.firestore()
        db.collection(plataforma).addSnapshotListener { QuerySnapshot, error in
            if let error = error?.localizedDescription {
                print("Error al mostrar datos \(error)")
            }else {
                self.datos.removeAll()
                for document in QuerySnapshot!.documents {
                    let valor = document.data()
                    let id = document.documentID
                    let titulo = valor["titulo"] as? String ?? "sin titulo"
                    let descripcion = valor["descripcion"] as? String ?? "sin descripcion"
                    let portada = valor["portada"] as? String ?? "sin portada"
                    
                    DispatchQueue.main.async {
                        let registros = FirebaseModel(id: id, titulo: titulo, descripcion: descripcion, portada: portada)
                        self.datos.append(registros)
                    }

                }
            }
        }
    }
}
