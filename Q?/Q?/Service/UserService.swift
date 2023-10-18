//
//  UserService.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

// This struct provides functionality to fetch user data from a Firestore database.
struct UserService {
    
    // Fetches a specific user's data from Firestore based on the provided UID.
    func fetchUser(withUid uid: String, completion: @escaping(Users) -> Void) {
        
        // Access the "users" collection in Firestore and get the document with the specified UID.
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                
                // Ensure that the snapshot (document data) exists.
                guard let snapshot = snapshot else { return }
                
                // Convert the snapshot data to a Users object.
                guard let user = try? snapshot.data(as: Users.self) else { return }
                
                // Call the completion handler with the fetched user data.
                completion(user)
            }
    }
    
    // Fetches all users' data from Firestore.
    func fetchUsers(completion: @escaping([Users]) -> Void) {
        
        // Access the "users" collection in Firestore and get all documents.
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                
                // Ensure that the snapshot (document data) exists.
                guard let documents = snapshot?.documents else { return }
                
                // Convert each document in the snapshot to a Users object and collect them in an array.
                let users = documents.compactMap({ try? $0.data(as: Users.self)})
                
                // Call the completion handler with the array of fetched user data.
                completion(users)
            }
    }
}

