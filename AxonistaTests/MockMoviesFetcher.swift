//
//  MockAPIRequest.swift
//  AxonistaTests
//
//  Created by Norman, ThankaVijay on 05/08/22.
//
import XCTest
import Foundation
@testable import Axonista

final class MockMoviesFetcher: Mockable, MovieFetchable {
    func movies() async -> Result<Movies, RequestError> {
        return .success(decode(filename: "movies", type: Movies.self))
    }

    func movieDetail(id: Int) async -> Result<Movie, RequestError> {
        return .success(decode(filename: "movie", type: Movie.self))
    }
}

class MockAPIRequestTests: XCTestCase {

    override func setUpWithError() throws {

    }

}
