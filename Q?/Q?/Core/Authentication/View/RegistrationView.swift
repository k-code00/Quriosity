//
//  RegistrationView.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
//    @Environment was used to handle my view presentations
    // A reference to the presentation mode of the current view. This can be used to programmatically dismiss the view.
    @Environment(\.presentationMode) var presentationMode

    // A shared authentication view model instance from the environment. This can be used to perform authentication actions and to observe authentication state.
    @EnvironmentObject var viewModel: AuthViewModel

    
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: ProfilePhotoSelectorView(),
                           isActive: $viewModel.didAuthenticateUser,
                           label: {})
            
            AuthHeaderView(title1: "Get Started.", title2: "Create Your Account.")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "Username",
                                 text: $username)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "Full Name",
                                 text: $fullname)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname, 
                                   username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemPurple))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already Have An Account?")
                        .font(.footnote)
                        .foregroundColor(Color(.systemPurple))
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemPurple))
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
