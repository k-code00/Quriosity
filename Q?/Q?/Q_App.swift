//
//  Q_App.swift
//  Q?
//
//  Created by kojo on 11/10/2023.
//

import SwiftUI
import Firebase

@main
struct Q_App: App {
    
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
