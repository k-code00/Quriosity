//
//  QFilterViewModel.swift
//  Q?
//
//  Created by kojo on 12/10/2023.
//

import Foundation


//caseiterable - provides a collection of all of its cases
enum QFilterViewModel: Int, CaseIterable {
    case questions
    case replies
    case likes
    
    var title: String {
        switch self {
        case .questions: return "Questions"
        case .replies: return "Answers"
        case .likes: return "Likes"
        }
    }
}
                            
