//
//  SwitchCategoriesButton.swift
//  MovieForToday
//
//  Created by Alex on 05.01.2024.
//

import SwiftUI

struct SwitchCategoriesButton: View {
    @State private var isSelected = false
    let genre: String
    let action: () -> Void
    
    var body: some View {
        Button {
            isSelected.toggle()
            action()
        } label: {
            Text(genre.capitalized)
                .padding()
                .foregroundStyle(isSelected ? .customMint : .textWhiteGrey)
                .if(isSelected) { $0.background(.customSoftDark) }
                .clipShape(.rect(cornerRadius: 12))
                .font(.custom(.montSemiBold, size: 12))
        }
        .padding(.leading)
    }
}

#Preview {
    SwitchCategoriesButton(genre: "action", action: {})
        .background(.customMain)
}
