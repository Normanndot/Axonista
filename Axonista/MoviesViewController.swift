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
        movieView()
        view.backgroundColor = .white
        self.title = "Top Movies"
        fetchMovies()
        subscribeToFetchEvent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func movieView() {
        let layout = MoviesUICollectionViewFlowLayout()
        let movieView = MoviesView(frame: view.frame, collectionViewLayout: layout)
        view.addSubview(movieView)
        movieView.pinToSafeAreaOfSuperview()
    }

    private func fetchMovies() {
        viewModel.fetchMovies()
    }

    private func subscribeToFetchEvent() {
        viewModel.onFetchMovieSuccess = { [weak self] in

        }

        viewModel.onFetchMovieFailure = { error in

        }
    }
}

class MoviesView: UICollectionView {

    var movies: [Movies]?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .purple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MoviesUICollectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        itemSize = CGSize(width: 60, height: 60)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
