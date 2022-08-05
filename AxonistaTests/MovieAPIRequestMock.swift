//
//  MovieAPIRequestMock.swift
//  AxonistaTests
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import XCTest
@testable import Axonista

class MovieAPIRequestMock: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
