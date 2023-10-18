//
//  FeedViewModel.swift
//  Q?
//
//  Created by Consultant on 17/10/2023.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var questions = [Question]()
    
    let service = QuestionService()
    
    init() {
        fetchQuestions()
    }
    
    func fetchQuestions() {
        service.fetchQuestions { questions in
            self.questions = questions
        }
    }
}
