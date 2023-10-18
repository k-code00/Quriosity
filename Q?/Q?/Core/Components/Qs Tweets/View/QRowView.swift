//
//  QRowView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI
import Kingfisher

// Represents a single row view for a question.
struct QRowView: View {
    // View model for managing the data and business logic of the QRowView.
    @ObservedObject var viewModel: QRowViewModel
    
    // Initializer that takes a 'Question' object and initializes the view model.
    //depenancy injection
    init(question: Question) {
        self.viewModel = QRowViewModel(question: question)
    }
    
    // The main body of the QRowView.
    var body: some View {
        VStack(alignment: .leading) {
            
            // Display user profile image, user information, and the question caption.
            if let user = viewModel.question.users {
                HStack(alignment: .top, spacing: 12) {
                    // Display user's profile image.
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // Display user information and the question caption.
                    VStack(alignment: .leading, spacing: 4) {
                        // Display user's full name, username, and relative timestamp.
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w") // Relative timestamp (e.g., "2 weeks ago").
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        // Display the question caption.
                        Text(viewModel.question.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // Display action icons (e.g., comment, share, like, save).
            HStack {
                // Comment button.
                Button {
                    // TODO: Define action for the comment button.
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                // Share button.
                Button {
                    // TODO: Define action for the share button.
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                // Like/unlike button.
                Button {
                    viewModel.question.didLike ?? false ?
                    viewModel.unlikeQuestion() :
                    viewModel.likeQuestion()
                } label: {
                    Image(systemName: viewModel.question.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.question.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                // Save/bookmark button.
                Button {
                    // TODO: Define action for the bookmark button.
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}
