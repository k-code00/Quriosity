//
//  ProfileViewModel.swift
//  Q?
//
//  Created by Consultant on 18/10/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var questions = [Question]()
    private let service = QuestionService()
    let user: Users
    
    init(user: Users) {
        self.user = user
        self.fetchUserQuestions()
    }
    
    func fetchUserQuestions() {
        guard let uid = user.id else { return }
        service.fetchQuestions(forUid: uid) { questions in
            self.questions = questions
            
            for i in 0 ..< questions.count {
                self.questions[i].users = self.user
            }
        }
    }
}
