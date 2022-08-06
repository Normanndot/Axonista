//
//  Int+Extension.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import Foundation

extension Int {
    var hms: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated

        let formattedString = formatter.string(from:TimeInterval(self))!
        print(formattedString)
        return formattedString
    }
}
