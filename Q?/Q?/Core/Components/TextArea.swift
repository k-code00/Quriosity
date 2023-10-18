//
//  TextArea.swift
//  Q?
//
//  Created by kojo on 13/10/2023.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    
    let placeholder: String
    
    //dependancy injection
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    //placeholder text does not show up -> DEBUG
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}

