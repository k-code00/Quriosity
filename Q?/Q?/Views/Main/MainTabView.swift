//
//  MainTabView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedIndex: Int
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView(viewModel: viewModel)
                .onTapGesture {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onTapGesture {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            NotificationsView()
                .onTapGesture {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(2)
            
            ConversationsView()
                .onTapGesture {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
        }
    }
}
