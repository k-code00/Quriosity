//
//  NewQuestionView.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import SwiftUI
import Kingfisher

struct NewQuestionView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadQuestionViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadQuestion(withCaption: caption)
                } label: {
                    Text("Question")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                //placeholder text is not showing up -> DEBUG
                TextArea("Ask Me A Question?", text: $caption)
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadQuestion) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    NewQuestionView()
}
