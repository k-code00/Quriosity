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
                
                guard let user = try? snapshot.data(as: Users.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([Users]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: Users.self)})
                
                completion(users)
            }
    }
}
