//
//  UserService.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(Users) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let users = try? snapshot.data(as: Users.self) else { return }
                
                print("DEBUG: Username Is \(users.username)")
                print("DEBUG: Email Is \(users.email)")
            }
    }
}
