//
//  ExploreViewModel.swift
//  Q?
//
//  Created by kojo on 16/10/2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [Users]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users Are \(users)")
        }
    }
}
