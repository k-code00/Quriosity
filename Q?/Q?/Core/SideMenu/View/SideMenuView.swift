//
//  SideMenuView.swift
//  Q?
//
//  Created by kojo on 12/10/2023.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    // Access to the authentication view model.
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // Main body of the SideMenuView.
    var body: some View {
        // Display the side menu if there's a current user.
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                // Display the current user's profile information.
                VStack(alignment: .leading) {
                    // User's profile image.
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    // User's full name and username.
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    // User statistics (e.g., followers, following, posts count).
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                // Iterate over all side menu options.
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    // Navigate to profile view when the 'Profile' option is selected.
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    // Logout action for 'Logout' option.
                    } else if viewModel == .logout {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    // Display other side menu options without specific actions.
                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }
                Spacer() // Push content to the top.
            }
        }
    }
}
