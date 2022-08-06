//
//  MoviesView.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import UIKit

class MoviesView: UICollectionView {
    var model: [Movie]? {
        didSet {
            self.reloadData()
        }
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .purple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
