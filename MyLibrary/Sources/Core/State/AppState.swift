//
//  AppState.swift
//
//
//  Created by Илья Шаповалов on 14.01.2024.
//

import Foundation
import ReduxCore

public protocol Action {}
public protocol DataDriven {
    mutating func reduce(_ action: Action)
}

public struct AppState: DataDriven {
    public var movies: [Movie.ID: Movie]
    
    public init() {
        movies = .init(minimumCapacity: 20)
    }
    
    mutating public func reduce(_ action: Action) {
        switch action {
        case let action as UpdateMovies:
            movies = Dictionary(uniqueKeysWithValues: action.movies.map { ($0.objectId, $0) })
            
        default: return
        }
    }
}

extension AppState {
    struct UpdateMovies: Action {
        let movies: [Movie]
        init(_ movies: [Movie]) { self.movies = movies }
    }
}
