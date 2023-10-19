//
//  SideMenuOptionView.swift
//  Q?
//
//  Created by kojo on 19/10/2023.
//

import SwiftUI

struct SideMenuOptionView: View {
    let option: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: option.imageName)
                .foregroundColor(.gray)
                .font(.system(size: 24))

            Text(option.description)
                .foregroundColor(.black)

            Spacer()
        }
    }
}
