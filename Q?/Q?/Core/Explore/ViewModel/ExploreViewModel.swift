//
//  ExploreViewModel.swift
//  Q?
//
//  Created by kojo on 16/10/2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [Users]()
    @Published var searchText = ""
    
    var searchableUsers: [Users] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
