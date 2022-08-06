//
//  MovieDetailViewModel.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import Foundation

protocol MovieDetailViewModel: AnyObject {
    var movieDetail: MovieDetail? { get set }
    var onFetchMovieSuccess: (() -> Void)? { get set }
    var onFetchMovieFailure: ((Error) -> Void)?  { get set }
    func fetchMovies()
}

final class MovieDetailDefaultViewModel: MovieDetailViewModel {

    private let movieFetcher: MovieFetchable

    init(fetcher: MovieFetchable, movie: Movie) {
        self.movieFetcher = fetcher
        self.movie = movie
    }
    
    var movie: Movie
    var movieDetail: MovieDetail?
    var onFetchMovieSuccess: (() -> Void)?
    var onFetchMovieFailure: ((Error) -> Void)?

    func fetchMovies() {
        Task(priority: .background) {
            let result = await movieFetcher.movieDetail(id: movie.id)
            switch result {
            case .success(let response):
                self.movieDetail = response
                self.onFetchMovieSuccess?()
            case .failure(let error):
                self.onFetchMovieFailure?(error)
            }
        }
    }
}
