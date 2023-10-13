//
//  NewQuestionView.swift
//  Q?
//
//  Created by Consultant on 13/10/2023.
//

import SwiftUI

struct NewQuestionView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
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
                    print("Question")
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
                Circle()
                    .frame(width: 64, height: 64)
                //placeholder text is not showing up -> DEBUG
                TextArea("Ask Me A Question?", text: $caption)
            }
            .padding()
        }
    }
}

#Preview {
    NewQuestionView()
}
