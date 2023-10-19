//
//  Constants.swift
//  Q?
//
//  Created by Consultant on 19/10/2023.
//

import Firebase
import FirebaseFirestore

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_TWEETS = Firestore.firestore().collection("tweets")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")
