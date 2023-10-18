//
//  Users.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

import FirebaseFirestoreSwift
import Firebase

//users object / model
struct Users: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
