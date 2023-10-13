//
//  QFilterViewModel.swift
//  Q?
//
//  Created by Consultant on 12/10/2023.
//

import Foundation

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
                            
