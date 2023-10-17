//
//  ExploreView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 25, id: \.self) { _ in
                        NavigationLink {
//                                ProfileView(user: user)
                        } label: {
                            UserRowView()
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExploreView()
}
