//
//  FeedViewModel.swift
//  Q?
//
//  Created by Consultant on 17/10/2023.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    // Published list of questions that will automatically notify the UI on changes.
    @Published var questions = [Question]()
    
    // Services to handle questions and user-related operations.
    let service = QuestionService()
    let userService = UserService()
    
    // Initializer fetches questions upon instantiation.
    init() {
        fetchQuestions()
    }
    
    // Fetches questions and associates each question with its corresponding user.
    func fetchQuestions() {
//invokes the fetchQuestions method of the service object
        service.fetchQuestions { questions in
            self.questions = questions
            
            // Loop through questions to fetch and associate user details.
            for i in 0 ..< questions.count {
                let uid = questions[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.questions[i].users = user
                }
            }
        }
    }
}

