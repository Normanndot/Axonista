//
//  Utils.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import Foundation

struct Utils {
    static func valueInInfoPlist(for key: String) -> String? {
        guard let infoDict = Bundle.main.infoDictionary,
              let value = infoDict[key],
              let endPoint = value as? String
        else {
            preconditionFailure("We should have a valid URL")
        }

        return endPoint
    }

    static var accessToken: String {
        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDUzODdmYzA4YzkyYmY4YWZmYTIxOWM5MzM1OGIzNyIsInN1YiI6IjYyZWJmYjY3ODU2NmQyMDA2Mjc3M2NiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H_sXvkUljUTinu_8-WmepLyScia8ykfLK17cdxgUAa4"
        return accessToken
    }
}
