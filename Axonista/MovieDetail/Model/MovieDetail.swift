//
//  MovieDetail.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let backdropPath: String
    let genres: [Genre]
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate: String
    let revenue, runtime: Int
    let tagline, title: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres, id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime, tagline, title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
