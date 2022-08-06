//
//  UIView+Extension.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 05/08/22.
//

import Foundation
import UIKit

extension UIView {
    func pinToSafeArea(of view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    func pinToSafeAreaOfSuperview() {
        guard let superview = self.superview else { return }
        pinToSafeArea(of: superview)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({ self.addSubview($0) })
    }

    func translatesAutoresizingMaskIntoConstraintsFalse(forViews: UIView...) {
        forViews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
    }
}
