//
//  CustomSearchBar.swift
//  MovieForToday
//
//  Created by Alex on 06.01.2024.
//

import SwiftUI

struct CustomSearchBar: View {
    @FocusState private var isFocused: Bool
    @Binding var searchText: String
    @Binding var isSearch: Bool
    let placeholderText: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                Image(.search)
                    .colorMultiply(Color.textColor(.grey))
                
                TextField(placeholderText, text: $searchText)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        withAnimation {
                            isSearch = newValue
                        }
                    }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .font(.custom(.montMedium, size: 14))
            .background(Color.primaryColor(.softDark))
            .clipShape(.rect(cornerRadius: 24))
            
            if isSearch && !searchText.isEmpty {
                Button {
                    withAnimation {
                        searchText = ""
                        isFocused = false
                    }
                    action()
                } label: {
                    Text("cancel")
                        .font(.custom(.montMedium, size: 14))
                        .foregroundStyle(Color.textColor(.whiteGrey))
                }
                .transition(.opacity)
            }
        }
    }
}

#Preview {
    CustomSearchBar(searchText: .constant(""), isSearch: .constant(true), placeholderText: "Search a title..", action: {})
}
