//
//  ContentView.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            //no user loggedd in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                //have a logged in user
                mainInterfaceView
            }
        }
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black).opacity(showMenu ? 0.25 : 0.0)
                } .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            //in zstack side menu view will be shown on top of main tab view
            //meaning anything placed under the main view will be shown on top
            //imaging a 3d stack where the bottom will be shown in front and the top is shown in the back
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
