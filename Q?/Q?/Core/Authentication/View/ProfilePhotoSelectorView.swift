//
//  ProfilePhotoSelectorView.swift
//  Q?
//
//  Created by Consultant on 15/10/2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Create Your Account",
                           title2: "Add A Profile Photo")
            
            Button {
                print("Pick Image Here")
            } label: {
                Image("addProfilePhoto")
                    .resizable()
                //changing color of button to match app blue
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
