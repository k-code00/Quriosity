//
//  QRowView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI
import Kingfisher

struct QRowView: View {
    @ObservedObject var viewModel: QRowViewModel
    
    init(question: Question) {
        self.viewModel = QRowViewModel(question: question)
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //profile image + user info + Qs
            if let user = viewModel.question.users {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    //user information & Q caption
                    VStack(alignment: .leading, spacing: 4) {
                        //user information
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        //Q caption
                        Text(viewModel.question.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            //icons
            HStack {
                Button {
                    // action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
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
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        //        .padding()
    }
}

//#Preview {
//    QRowView()
//}
