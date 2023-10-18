//
//  NewQuestionView.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import SwiftUI
import Kingfisher

struct NewQuestionView: View {
    // State for the question's caption.
    @State private var caption = ""
    
    // Access to the current presentation mode of the view (e.g., modal).
    @Environment(\.presentationMode) var presentationMode
    
    // Access to the authentication view model.
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // View model for uploading a question.
    @ObservedObject var viewModel = UploadQuestionViewModel()
    
    // Main body of the NewQuestionView.
    var body: some View {
        VStack {
            HStack {
                // Cancel button to dismiss the view.
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemPurple))
                }
                
                Spacer()
                
                // Button to post the question.
                Button {
                    viewModel.uploadQuestion(withCaption: caption)
                } label: {
                    Text("Question")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemPurple))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                // Display the profile image of the current user.
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                // Text area for entering the question's caption.
                // NOTE: Placeholder text issue needs debugging.
                TextArea("Ask Me A Question?", text: $caption)
            }
            .padding()
        }
        // Listen for changes in the 'didUploadQuestion' property of the view model.
        .onReceive(viewModel.$didUploadQuestion) { success in
            // If the question was successfully uploaded, dismiss the view.
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

