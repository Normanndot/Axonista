//
//  MoviesUICollectionViewFlowLayout.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import UIKit


class MoviesUICollectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        itemSize = CGSize(width: 60, height: 60)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
