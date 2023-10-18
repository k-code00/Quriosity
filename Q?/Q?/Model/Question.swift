//
//  Question.swift
//  Q?
//
//  Created by Consultant on 17/10/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Question: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var users: Users?
}
