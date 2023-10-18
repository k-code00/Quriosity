//
//  AuthViewModel.swift
//  Q?
//
//  Created by kojo on 14/10/2023.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: Users?
    private var tempUserSession: User?
    private let service = UserService()
    
    // Constructor: fetches the current user's session and details upon initialization.
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    // Function to log in a user using email and password.
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            // Handle any login errors.
            if let error = error {
                print("DEBUG: Failed To Register With Error \(error.localizedDescription)")
                return
            }
            
            // Store the user's session and fetch their details.
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    // Function to register a new user with email, password, and other details.
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            // Handle any registration errors.
            if let error = error {
                print("DEBUG: Failed To Register With Error \(error.localizedDescription)")
                return
            }
            
            // Store the user's session temporarily and save their details to the database.
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
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
    
    // Function to sign out the current user.
    func signOut() {
        // Reset the authentication flags and user session.
        didAuthenticateUser = false
        userSession = nil
        
        // Sign out from the authentication server.
        try? Auth.auth().signOut()
    }
    
    // Function to upload a user's profile image and update their database entry.
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    // Function to fetch the details of the currently authenticated user.
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}

