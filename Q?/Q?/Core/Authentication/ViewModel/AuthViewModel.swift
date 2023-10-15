//
//  AuthViewModel.swift
//  Q?
//
//  Created by kojo on 14/10/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var didAuthenticateUser = false
    private var tempUserSession: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User Session Is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed To Register With Error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            print("DEBUG: Did Log User In")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed To Register With Error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession  = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        //sets user session to nil so login screens shows
        userSession = nil
        
        //sign out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
    }
 }
