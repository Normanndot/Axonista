//
//  MovieFetcher.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import Foundation

protocol MovieFetchable {
    func movies() async -> Result<Movies, RequestError>
    func movieDetail(id: Int) async -> Result<Movie, RequestError>
}

struct MovieFetcher: HTTPClient, MovieFetchable {
    func movies() async -> Result<Movies, RequestError> {
        return await fetch(request: MovieAPIRequest.movies, responseModel: Movies.self)
    }

    func movieDetail(id: Int) async -> Result<Movie, RequestError> {
        return await fetch(request: MovieAPIRequest.movieDetail(id: id), responseModel: Movie.self)
    }
}
