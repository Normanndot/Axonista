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

    func movieDetail(id: Int) async -> Result<MovieDetail, RequestError> {
        return .success(decode(filename: "movie", type: MovieDetail.self))
    }
}
