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
    let userService = UserService()
    
    init() {
        fetchQuestions()
    }
    
    func fetchQuestions() {
        service.fetchQuestions { questions in
            self.questions = questions
            
            for i in 0 ..< questions.count {
                let uid = questions[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.questions[i].users = user
                }
            }
        }
    }
}
