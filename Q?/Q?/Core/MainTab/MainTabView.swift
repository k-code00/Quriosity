//
//  MainTabView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture(perform: {
                    self.selectedIndex = 0
                })
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                .onTapGesture(perform: {
                    self.selectedIndex = 1
                })
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
//            NotificationsView()
//                .onTapGesture(perform: {
//                    self.selectedIndex = 2
//                })
//                .tabItem {
//                    Image(systemName: "bell")
//                }.tag(2)
            
//            MessagesView()
//                .onTapGesture(perform: {
//                    self.selectedIndex = 3
//                })
//                .tabItem {
//                    Image(systemName: "envelope")
//                }.tag(3)
        }
    }
}

#Preview {
    MainTabView()
}
