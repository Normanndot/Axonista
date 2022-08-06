//
//  MovieDetailViewController.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    private let viewModel: MovieDetailViewModel
    private var detailView: MovieDetailView?

    init(viewModel: MovieDetailViewModel) {
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
        movieDetailView()
        fetchMovieDetail()
        subscribeToFetchEvent()
    }

    private func movieDetailView() {
        let detailView = MovieDetailView(frame: self.view.frame)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        self.detailView = detailView

        if let movieDetailView = self.detailView {
            view.addSubview(movieDetailView)
            movieDetailView.pinToSafeAreaOfSuperview()
        }
    }

    private func fetchMovieDetail() {
        viewModel.fetch()
    }

    private func subscribeToFetchEvent() {
        viewModel.onFetchMovieSuccess = { [weak self] in
            self?.detailView?.detail = self?.viewModel.movieDetail
        }
    }
}
