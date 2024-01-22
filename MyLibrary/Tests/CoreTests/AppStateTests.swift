//
//  AppStateTests.swift
//  
//
//  Created by Илья Шаповалов on 14.01.2024.
//

import XCTest
@testable import Core

final class AppStateTests: XCTestCase {
    private var sut: AppState!
    private var action: Action!
    
    override func setUp() async throws {
        try await super.setUp()
        sut = AppState()
    }
    
    override func tearDown() async throws {
        try await super.tearDown()
        sut = nil
    }
    
    func test_updateMovies() {
        let movie = Movie.test(1)
        action = AppState.UpdateMovies([movie])
        
        sut.reduce(action)
        
        XCTAssertEqual(sut.movies.keys.contains(movie.objectId), true)
    }
}

extension Movie {
    static func test(_ id: Int) -> Self {
        .init(id: id, urlPoster: "", backdrop: "", rating: "", name: "", description: "", year: "", duration: "", genres: [], persons: [], trailerUrl: "")
    }
}
