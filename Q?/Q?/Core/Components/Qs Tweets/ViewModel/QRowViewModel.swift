//
//  QRowViewModel.swift
//  Q?
//
//  Created by Consultant on 18/10/2023.
//

import Foundation

class QRowViewModel: ObservableObject {

    // Observable question object. Changes to this will be reflected in the view.
    @Published var question: Question

    // Instance of the QuestionService to handle interactions with Firestore.
    private let service = QuestionService()
    
    // Initializer that sets up the initial state of the ViewModel.
    //depenancy injection
    init(question: Question) {
        self.question = question
        
        // Check if the user has already liked this question.
        checkIfUserLikedQuestion()
    }
    
    // Function to "like" the question. It updates the Firestore and the local state.
    func likeQuestion() {
        service.likeQuestion(question) {
            // Update the local state to reflect that the user has liked the question.
            self.question.didLike = true
        }
    }
    
    // Function to "unlike" the question. It updates the Firestore and the local state.
    func unlikeQuestion() {
        service.unlikeQuestion(question) {
            // Update the local state to reflect that the user has unliked the question.
            self.question.didLike = false
        }
    }
    
    // Checks if the user has already liked the question and updates the local state accordingly.
    func checkIfUserLikedQuestion() {
        service.checkIfUserLikedQuestion(question) { didLike in
            if didLike {
                // If the user has liked the question, update the local state.
                self.question.didLike = true
            }
        }
    }
}

