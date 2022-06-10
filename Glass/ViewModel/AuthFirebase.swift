//
//  AuthViewModel.swift
//  Glass
//
//  Created by Арсений Сторчевой on 24.05.2022.
//

import SwiftUI
import FirebaseAuth
import Firebase

class AuthFirebase: ObservableObject {
    
    @Published var userSession: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    func logIn(withemail email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did succsesfully loged in.")
        }
    }
    
    func register(withemail email: String, password: String, username: String, fullName: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
        
        if let error = error {
            print("DEBUG: Failed to register with error \(error.localizedDescription)")
            return
        }
            
        guard let user = result?.user else { return }
        self.userSession = user
        
        print("DEBUG: Registered user sucsessfully")
        print("DEBUG: User is \(String(describing: self.userSession))")
        
        let data = ["email" : email,
                    "username" : username.lowercased(),
                    "fullname" : fullName, "uid" : user.uid]
            
        Firestore.firestore().collection("users")
            .document(user.uid)
            .setData(data) { _ in
                print("DEBUG: Did upload user data!")
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
