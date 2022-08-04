//
//  RequestError.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 04/08/22.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unexpectedStatusCode
    case unknown
    case redirection
    case clientError
    case serverError

    var customMessage: String {
        switch self {
        case .decode: return "Decode error"
        case .clientError: return "Session expired"
        default: return "Unknown"
        }
    }
}
