//
//  ExploreViewModel.swift
//  Q?
//
//  Created by kojo on 16/10/2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    // Observable property that holds a list of all users.
    @Published var users = [Users]()
    
    // Observable property to hold the current search text entered by the user.
    @Published var searchText = ""
    
    // Computed property to return a filtered list of users based on the search text.
    var searchableUsers: [Users] {
        // If no search text is provided, return all users.
        if searchText.isEmpty {
            return users
        } else {
            // Convert search text to lowercase for case-insensitive search.
            let lowercasedQuery = searchText.lowercased()
            
            // Filter users based on whether their username or fullname contains the search text.
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    // Instance of UserService to interact with user-related database tasks.
    let service = UserService()
    
    // Constructor: fetches the list of all users upon initialization.
    init() {
        fetchUsers()
    }
    
    // Function to fetch all users using the UserService.
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
