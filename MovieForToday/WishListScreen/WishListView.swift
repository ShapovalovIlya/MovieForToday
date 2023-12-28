//
//  WishListView.swift
//  MovieForToday
//
//  Created by Aleksandr Rybachev on 23.12.2023.
//

import SwiftUI

struct WishListView: View {
    @StateObject var viewModel = PopularMovieViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryColor(.mainDark)
                    .ignoresSafeArea()
                
                if viewModel.movieModels.isEmpty {
                    PlaceholderView()
                } else {
                    ScrollView(showsIndicators: false) {
                        // TODO: временное решение
                        ForEach(viewModel.movieModels, id: \.name) { movie in
                            NavigationLink {
                                // MovieDetailView()
                            } label: {
                                WishListViewCell(movieModel: movie)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Wishlist")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    WishListView()
}
