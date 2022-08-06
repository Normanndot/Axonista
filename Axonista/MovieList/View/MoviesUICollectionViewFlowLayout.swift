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
        sectionInset = UIEdgeInsets(top: 10, left: 22.5, bottom: 20, right: 22.5)
        itemSize = CGSize(width: 60, height: 60)
        scrollDirection = .vertical
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
