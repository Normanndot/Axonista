//
//  Movies.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 04/08/22.
//

import Foundation

struct Movies: Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
