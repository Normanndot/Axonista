//
//  MovieFetcher.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import Foundation
import UIKit
import NetworkLibrary

protocol MovieFetchable {
    func movies() async -> Result<Movies, RequestError>
    func movieDetail(id: Int) async -> Result<MovieDetail, RequestError>
}

struct MovieFetcher: HTTPClient, MovieFetchable {
    func movies() async -> Result<Movies, RequestError> {
        return await fetch(request: MovieAPIRequest.movies, responseModel: Movies.self)
    }

    func movieDetail(id: Int) async -> Result<MovieDetail, RequestError> {
        return await fetch(request: MovieAPIRequest.movieDetail(id: id), responseModel: MovieDetail.self)
    }
}
