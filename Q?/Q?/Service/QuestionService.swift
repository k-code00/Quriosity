//
//  QuestionService.swift
//  Q?
//
//  Created by Consultant on 17/10/2023.
//

import Firebase
import FirebaseFirestore

struct QuestionService {
    
    func uploadQuestion(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
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
    
    func fetchQuestions(completion: @escaping([Question]) -> Void) {
        Firestore.firestore().collection("questions")
        //question sorter
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let questions = documents.compactMap({ try? $0.data(as: Question.self) })
                completion(questions)
            }
    }
    
    func fetchQuestions(forUid uid: String, completion: @escaping([Question]) -> Void) {
        Firestore.firestore().collection("questions")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let questions = documents.compactMap({ try? $0.data(as: Question.self) })
                completion(questions.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }
    }
    
    func likeQuestion(_ question: Question, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let questionId = question.id else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("questions").document(questionId)
            .updateData(["likes": question.likes + 1]) { _ in
                userLikesRef.document(questionId).setData([:]) { _ in
                    completion()
                }
            }
    }
}

