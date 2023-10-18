//
//  QRowViewModel.swift
//  Q?
//
//  Created by Consultant on 18/10/2023.
//

import Foundation

class QRowViewModel: ObservableObject {
    let question: Question
    private let service = QuestionService()
    
    init(question: Question) {
        self.question = question
    }
    
    func likeQuestion() {
        service.likeQuestion(question)
    }
}
