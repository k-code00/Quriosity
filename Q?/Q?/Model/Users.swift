//
//  Users.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

import FirebaseFirestoreSwift
import Firebase

//users object / model
struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    var stats: UserStats
    var bio: String?
    
    var isFollowed = false
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
        self.bio = dictionary["bio"] as? String ?? ""
    }
}

struct UserStats {
    var followers: Int
    var following: Int
}
