//
//  Movie.swift
//
//
//  Created by Илья Шаповалов on 14.01.2024.
//

import Foundation

public struct Movie {
    public let id: Int
    public let urlPoster: String
    public let backdrop: String
    public let rating: String
    public let name: String
    public let description: String
    public let year: String
    public let duration: String
    public let genres: [String]
    public let persons: [Person]
    public let trailerUrl: String
    
    public var objectId: ID { ID(id) }
    
    init(
        id: Int,
        urlPoster: String,
        backdrop: String,
        rating: String,
        name: String,
        description: String,
        year: String,
        duration: String,
        genres: [String],
        persons: [Person],
        trailerUrl: String
    ) {
        self.id = id
        self.urlPoster = urlPoster
        self.backdrop = backdrop
        self.rating = rating
        self.name = name
        self.description = description
        self.year = year
        self.duration = duration
        self.genres = genres
        self.persons = persons
        self.trailerUrl = trailerUrl
    }
}

extension Movie {
    public struct ID: Hashable, Equatable, Comparable {
        public let movieId: Int
        
        init(_ movieId: Int) { self.movieId = movieId }
        
        @inlinable
        public static func < (lhs: Movie.ID, rhs: Movie.ID) -> Bool {
            lhs.movieId < rhs.movieId
        }
    }
}
