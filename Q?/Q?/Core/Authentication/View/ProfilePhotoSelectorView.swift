//
//  ProfilePhotoSelectorView.swift
//  Q?
//
//  Created by Consultant on 15/10/2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup Account",
                           title2: "Add A Profile Photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                
                if let profileImage = profileImage {
                    profileImage
                        .modifier(ProfileImageModifier())
                } else {
                    Image("addProfilePhoto")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
