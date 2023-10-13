//
//  FeedView.swift
//  Q?
//
//  Created by Consultant on 11/10/2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewQuestionView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0...20, id: \.self) { _ in
                        QRowView()
                            .padding()
                    }
                }
            }
            Button {
                showNewQuestionView.toggle()
            } label: {
                Image(systemName: "book")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewQuestionView) {
                NewQuestionView()
            }
        }
    }
}

#Preview {
    FeedView()
}
