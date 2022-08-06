//
//  MoviesViewController.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import Foundation
import UIKit

final class MoviesViewController: UIViewController {

    private let viewModel: MoviesViewModel
    private var moviesView: MoviesView?

    init(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        movieView()
        self.title = "Top Movies"
        fetchMovies()
        subscribeToFetchEvent()
    }

    private func movieView() {
        let layout = MoviesUICollectionViewFlowLayout()
        let movieView = MoviesView(frame: self.view.frame, collectionViewLayout: layout)
        movieView.translatesAutoresizingMaskIntoConstraints = false
        moviesView = movieView
        if let moviesView = moviesView {
            view.addSubview(moviesView)
            moviesView.pinToSafeAreaOfSuperview()
        }
    }

    private func fetchMovies() {
        viewModel.fetch()
    }

    private func subscribeToFetchEvent() {
        viewModel.onFetchMovieSuccess = { [weak self] in
            self?.moviesView?.model = self?.viewModel.movies
        }

        viewModel.onFetchMovieFailure = { error in
            //
        }

        moviesView?.navigateMovieDetail = { [weak self] aMovie in
            if let aMovie = aMovie {
                let fetcher = MovieFetcher()
                let detailViewModel = MovieDetailDefaultViewModel(fetcher: fetcher, movie: aMovie)
                let detail = MovieDetailViewController(viewModel: detailViewModel)
                self?.navigationController?.pushViewController(detail, animated: true)
            }
        }
    }
}
