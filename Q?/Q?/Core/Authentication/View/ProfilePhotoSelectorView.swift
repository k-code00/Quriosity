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
                Image("addProfilePhoto")
                    .resizable()
                //changing color of button to match app blue
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
