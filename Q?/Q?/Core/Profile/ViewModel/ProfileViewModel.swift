//
//  ProfileViewModel.swift
//  Q?
//
//  Created by Consultant on 18/10/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    // Observable property that holds a list of questions associated with the user.
    @Published var questions = [Question]()
    
    // Instance of QuestionService to interact with question-related database tasks.
    private let service = QuestionService()
    
    // Property that stores information about the user whose profile is being managed.
    let user: Users
    
    // Constructor: initializes the ViewModel with a user and fetches their questions.
    init(user: Users) {
        self.user = user
        self.fetchUserQuestions()
    }
    
    // Function to fetch questions associated with the given user.
    func fetchUserQuestions() {
        // Ensure the user has a valid ID before fetching.
        guard let uid = user.id else { return }
        
        // Fetch questions for the user using the service.
        service.fetchQuestions(forUid: uid) { questions in
            // Update the questions property with the fetched questions.
            self.questions = questions
            
            // Associate each fetched question with the user.
            for i in 0 ..< questions.count {
                self.questions[i].users = self.user
            }
        }
    }
}

