//
//  QuestionService.swift
//  Q?
//
//  Created by Consultant on 17/10/2023.
//

import Firebase
import FirebaseFirestore

// A service struct that provides utilities for handling questions in the Firestore database.
struct QuestionService {
    
    // Uploads a new question to Firestore.
    func uploadQuestion(caption: String, completion: @escaping(Bool) -> Void) {
        
        // Ensure that there is a logged-in user.
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // Data to be saved for the question.
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
        // Save the data to the "questions" collection in Firestore.
        Firestore.firestore().collection("questions").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed To Upload Tweet With Error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    // Fetches all questions from Firestore, sorted by timestamp.
    func fetchQuestions(completion: @escaping([Question]) -> Void) {
        Firestore.firestore().collection("questions")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let questions = documents.compactMap({ try? $0.data(as: Question.self) })
                completion(questions)
            }
    }
    
    // Fetches questions for a specific user from Firestore, sorted by timestamp.
    func fetchQuestions(forUid uid: String, completion: @escaping([Question]) -> Void) {
        Firestore.firestore().collection("questions")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let questions = documents.compactMap({ try? $0.data(as: Question.self) })
                completion(questions.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }
    }
    
    // Increases the likes count for a question and records the like for the user.
    func likeQuestion(_ question: Question, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let questionId = question.id else { return }
        
        // Reference to the user's "likes" in Firestore.
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("questions").document(questionId)
            .updateData(["likes": question.likes + 1]) { _ in
                userLikesRef.document(questionId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    // Decreases the likes count for a question and removes the like record for the user.
    func unlikeQuestion(_ question: Question, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let questionId = question.id else { return }
        guard question.likes > 0 else { return }
        
        // Reference to the user's "likes" in Firestore.
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("questions").document(questionId)
            .updateData(["likes": question.likes - 1]) { _ in
                userLikesRef.document(questionId).delete { _ in
                    completion()
                }
            }
    }
    
    // Checks if the current user has liked a specific question.
    func checkIfUserLikedQuestion(_ question: Question, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let questionId = question.id else { return }
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(questionId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
}
