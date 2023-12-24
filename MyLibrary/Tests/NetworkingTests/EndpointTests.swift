//
//  EndpointTests.swift
//  
//
//  Created by Илья Шаповалов on 24.12.2023.
//

import XCTest
@testable import Networking

final class EndpointTests: XCTestCase {
    func test_movieList() {
        let sut = Endpoint.movieList()
        
        XCTAssertEqual(
            sut.url,
            URL(string: "https://api.kinopoisk.dev/v1.4/list?page=1&limit=10")
        )
    }
    
    func test_movieListPaginated() {
        let sut = Endpoint.movieList(page: 2, limit: 1)
        
        XCTAssertEqual(
            sut.url,
            URL(string: "https://api.kinopoisk.dev/v1.4/list?page=2&limit=1")
        )
    }
    
    func test_movieListWithSlug() {
        let sut = Endpoint.movieList(for: "Baz")
        
        XCTAssertEqual(
            sut.url,
            URL(string: "https://api.kinopoisk.dev/v1.4/list/Baz?page=1&limit=10")
        )
    }
}
