//
//  QRowViewModel.swift
//  Q?
//
//  Created by Consultant on 18/10/2023.
//

import Foundation

class QRowViewModel: ObservableObject {
    @Published var question: Question
    private let service = QuestionService()
    
    init(question: Question) {
        self.question = question
        checkIfUserLikedQuestion()
    }
    
    func likeQuestion() {
        service.likeQuestion(question) {
            self.question.didLike = true
        }
    }
    
    func unlikeQuestion() {
        service.unlikeQuestion(question) {
            self.question.didLike = false
        }
    }
    
    func checkIfUserLikedQuestion() {
        service.checkIfUserLikedQuestion(question) { didLike in
            if didLike {
                self.question.didLike = true
            }
        }
    }
}
