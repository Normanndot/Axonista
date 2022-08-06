//
//  String+Extension.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import Foundation

extension String {
    var ddMMMyyyy: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: self)
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd MMM yyyy"
        return formatter1.string(from: date ?? Date.now)
    }
}
