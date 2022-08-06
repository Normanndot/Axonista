//
//  MoviesViewModel.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import Foundation

protocol MoviesViewModel: AnyObject {
    var movies: [Movie] { get set }
    var onFetchMovieSuccess: (() -> Void)? { get set }
    var onFetchMovieFailure: ((Error) -> Void)?  { get set }
    func fetchMovies()
}

final class MoviesDefaultViewModel: MoviesViewModel {

    private let movieFetcher: MovieFetchable

    init(fetcher: MovieFetchable) {
        self.movieFetcher = fetcher
    }

    var movies: [Movie] = []
    var onFetchMovieSuccess: (() -> Void)?
    var onFetchMovieFailure: ((Error) -> Void)?

    func fetchMovies() {
        Task(priority: .background) {
            let result = await movieFetcher.movies()
            switch result {
            case .success(let response):
                self.movies = response.results
                self.onFetchMovieSuccess?()
            case .failure(let error):
                self.onFetchMovieFailure?(error)
            }
        }
    }
}
