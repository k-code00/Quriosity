//
//  AuthenticationHeader.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import SwiftUI


//The code defines a SwiftUI view called AuthHeaderView. This view displays two text labels (titles) stacked vertically inside a purple rounded background. Here's a summary of its features:
//
//The view takes in two strings: title1 and title2, which will be displayed as the two titles.
//These titles are displayed using a large font size (largeTitle) and semi-bold font weight.
//The titles are left-aligned inside a VStack with a leading alignment.
//A spacer is placed at the top of the VStack to push the titles to the bottom.
//The overall height of the view is set to 260 points.
//There's padding on the left side (leading) of the titles.
//The background color of the view is set to systemPurple, and the titles' color is set to white.
//The bottom right corner of the view is rounded using a custom shape (RoundedShape).

struct AuthHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemPurple))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    AuthHeaderView(title1: "Hello.", title2: "Welcome Back.")
}
