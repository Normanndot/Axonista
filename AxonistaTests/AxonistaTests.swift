//
//  AxonistaTests.swift
//  AxonistaTests
//
//  Created by Norman, ThankaVijay on 04/08/22.
//

import XCTest
@testable import Axonista

class AxonistaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMoviesControllerFetchData() throws {
        let fetcher = MockMoviesFetcher()
        let viewModel: MoviesViewModel = MoviesDefaultViewModel(fetcher: fetcher)
        let viewController = MoviesViewController(viewModel: viewModel)
        viewController.viewDidLoad()
        sleep(1)
        XCTAssertEqual(viewModel.movies.count, 20)
        XCTAssertEqual(viewModel.movies.first?.title, "The Shawshank Redemption")
    }

    func testMovieDetailViewControllerFetchData() throws {
        let fetcher = MockMoviesFetcher()
        let movieViewModel: MoviesViewModel = MoviesDefaultViewModel(fetcher: fetcher)
        let movieViewController = MoviesViewController(viewModel: movieViewModel)
        movieViewController.viewDidLoad()
        sleep(1)

        let moviesView = movieViewController.view.subviews.filter { $0.isKind(of: MoviesView.self) }.first
        XCTAssert(moviesView is MoviesView)

        let viewModel: MovieDetailViewModel = MovieDetailDefaultViewModel(fetcher: fetcher, movie: movieViewModel.movies[1])
        let viewController = MovieDetailViewController(viewModel: viewModel)
        viewController.viewDidLoad()
        sleep(1)
        XCTAssertEqual(viewModel.movieDetail?.id, 238)
        XCTAssertEqual(viewModel.movieDetail?.popularity, 106.461)

        let movieDetailView = viewController.view.subviews.filter { $0.isKind(of: MovieDetailView.self) }.first
        XCTAssert(movieDetailView is MovieDetailView)
    }

    func testMovieFetcher() throws {
        let fetcher = MovieFetcher()

        let movieViewModel: MoviesViewModel = MoviesDefaultViewModel(fetcher: fetcher)
        let movieViewController = MoviesViewController(viewModel: movieViewModel)
        movieViewController.viewDidLoad()
        sleep(1)

        let movieDetailViewModel: MovieDetailViewModel = MovieDetailDefaultViewModel(fetcher: fetcher, movie: movieViewModel.movies[1])
        let detailViewController = MovieDetailViewController(viewModel: movieDetailViewModel)
        detailViewController.viewDidLoad()
    }

    func testMoviesAPIRequest() throws {
        let moviesAPI = MovieAPIRequest.movies
        let expectedHeaders = ["Authorization": "Bearer \(Utils.accessToken)",
                               "Content-Type":"application/json;charset=utf-8"]
        XCTAssertTrue(moviesAPI.path == "/3/movie/top_rated", "Some is going to be grounded 🔥. Check who made this change")
        XCTAssertTrue(moviesAPI.baseURL == "https://api.themoviedb.org", "Aren't we not developing Movie App? 🙄")
        XCTAssertTrue(moviesAPI.urlRequest.allHTTPHeaderFields == expectedHeaders, "Is it working in PostMan?")
        XCTAssertTrue(moviesAPI.method == .get, "This is a get HTTP method. Did it got changed? 🚀")
    }

    func testExtensions() throws {
        let runtime = 5000
        XCTAssert(runtime.hms == "1h 23m 20s")

        let date = "1999-07-30"
        XCTAssert(date.ddMMMyyyy == "30 Jul 1999")
    }
}
