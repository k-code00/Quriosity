//
//  SearchBar.swift
//  Q?
//
//  Created by Consultant on 17/10/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    })
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    SearchBar(text: .constant(""))
        .previewLayout(.sizeThatFits)
}
