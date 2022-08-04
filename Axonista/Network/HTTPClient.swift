//
//  HTTPClient.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 04/08/22.
//

import Foundation
import UIKit

protocol HTTPClient {
    func fetch<Element: Decodable>(request: APIRequest, responseModel: Element.Type) async -> Result<Element, RequestError>
}

extension HTTPClient {
    func fetch<Element: Decodable>(request: APIRequest, responseModel: Element.Type) async -> Result<Element, RequestError> {

        do {
            let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 300...399:
                return .failure(.redirection)
            case 400...499:
                return .failure(.clientError)
            case 500...599:
                return .failure(.serverError)
            default:
                return .failure(.unexpectedStatusCode)
            }
        }
        catch {
            return.failure(.unknown)
        }
    }
}

