//
//  QRowView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI

struct QRowView: View {
    let question: Question
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //profile image + user info + Qs
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                //user information & Q caption
                VStack(alignment: .leading, spacing: 4) {
                    //user information
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                            
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    //Q caption
                    Text(question.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            //icons
            HStack {
                Button {
                    //action goes here
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
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
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
