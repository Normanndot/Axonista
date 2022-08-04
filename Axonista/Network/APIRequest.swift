//
//  APIRequest.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import Foundation

enum Scheme {
    static let followedBy = "://"
}

protocol APIRequest {
    var path: String { get }
    var baseURL: String { get }
    var method: RequestMethod? { get }
    var urlRequest: URLRequest { get }
    var body: [String: String]? { get }
}

extension APIRequest {
    var baseURL: String {
        guard let indexEndpointBaseURL = Utils.valueInInfoPlist(for: "BASE_URL"),
              let schemeType = Utils.valueInInfoPlist(for: "SCHEME_TYPE")
        else {
            preconditionFailure("We should have a valid URL")
        }
        
        let baseURLString = schemeType + Scheme.followedBy + indexEndpointBaseURL

        return baseURLString
    }

    var urlRequest: URLRequest {
        let urlString = baseURL.appending(path)

        guard let unwrappedURL = URL(string: urlString) else {
            preconditionFailure("We should have a valid URL")
        }

        var urlRequest = URLRequest(url: unwrappedURL)

        if method != nil {
            urlRequest.httpMethod = method?.rawValue
        }

        urlRequest.allHTTPHeaderFields = ["Authorization": "Bearer \(Utils.accessToken)",
                                          "Content-Type":"application/json;charset=utf-8"]

        return urlRequest
    }

    var httpMethod: String? { return nil }
}
