//
//  LoginView.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import SwiftUI

struct LoginView: View {

    // State properties for binding to the email and password input fields.
    @State private var email = ""
    @State private var password = ""

    // Reference to the shared authentication view model.
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // Primary container for the entire login view.
        VStack {
            
            // Custom header view at the top of the login screen.
            AuthHeaderView(title1: "Hello.", title2: "Welcome Back.")
            
            // Container for input fields.
            VStack(spacing: 40) {

                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            // Link for resetting the password.
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemPurple))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            // Button for initiating the login process.
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemPurple))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y: 0) // Adding a shadow effect to the button.
            
            Spacer()
            
            // Navigation link for users who don't have an account and want to sign up.
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack {
                    Text("Don't Have An Account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemPurple))
        }
        .ignoresSafeArea()             // Ensure the view takes up the entire screen, ignoring safe area insets.
        .navigationBarHidden(true)    // Hide the navigation bar for this view.
    }
}

#Preview {
    LoginView()
}
