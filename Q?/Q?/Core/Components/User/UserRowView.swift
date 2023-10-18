//
//  UserRowView.swift
//  Q?
//
//  Created by kojo on 12/10/2023.
//

import SwiftUI
import Kingfisher

//individual question cells
struct UserRowView: View {
    let user: Users
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

//#Preview {
//    UserRowView()
//}
