//
//  ProfilePhotoSelectorView.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

//designed for users to set up their account by adding a profile photo. It allows users to pick a profile image using an image picker. Once an image is selected, the user can upload it using a "Continue" button. The view utilizes an AuthViewModel to handle the profile image upload.


import SwiftUI

// SwiftUI View for selecting and uploading a profile photo.
struct ProfilePhotoSelectorView: View {
    
    // State properties for controlling the image picker and storing the selected image.
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    // Shared authentication view model instance for handling profile image upload.
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            AuthHeaderView(title1: "Setup Account",
                           title2: "Add A Profile Photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                // If a profile image is already selected, show it.
                // Otherwise, show a default "addProfilePhoto" image.
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image("addProfilePhoto")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            // Display the image picker when 'showImagePicker' is true.
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            // If an image is selected, show the "Continue" button to upload it.
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemPurple))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    // Function to load the selected image into the 'profileImage' state property.
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

// A custom ViewModifier to style the profile image with a specific size, shape, and color.
private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemPurple))
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
