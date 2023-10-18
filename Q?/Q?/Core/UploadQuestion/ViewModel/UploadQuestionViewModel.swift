//
//  UploadQuestionViewModel.swift
//  Q?
//
//  Created by kojo on 17/10/2023.
//

import Foundation

class UploadQuestionViewModel: ObservableObject {
    @Published var didUploadQuestion  = false
    
    let service = QuestionService()
    
    func uploadQuestion(withCaption caption: String) {
        service.uploadQuestion(caption: caption) { success in
            if success {
                self.didUploadQuestion = true
            } else {
             // show error message to user
            }
        }
    }
}
