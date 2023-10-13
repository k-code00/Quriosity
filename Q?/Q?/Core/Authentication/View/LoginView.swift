//
//  LoginView.swift
//  Q?
//
//  Created by Consultant on 13/10/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        //parent container
        VStack {
            
            //header view
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                }
                
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome Back.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            .clipShape(RoundedShape(corners: .bottomRight))
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
