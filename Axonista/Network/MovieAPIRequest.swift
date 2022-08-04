//
//  MovieAPI.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import Foundation

enum MovieAPIRequest {
    case movies
    case movieDetail(id: Int)
}

extension MovieAPIRequest: APIRequest {

    var path: String {
        switch self {
        case .movies:
            return "/3/movie/top_rated"
        case .movieDetail(let id):
            return "/3/movie/\(id)"
        }
    }

    var method: RequestMethod? {
        return .get
    }

    var body: [String : String]? { return nil }
}
//http://api.themoviedb.org/3/movie/top_rated?api_key=505387fc08c92bf8affa219c93358b37
