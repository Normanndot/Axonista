//
//  MoviesView.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import UIKit

class MoviesView: UICollectionView {
    var navigateMovieDetail: ((Movie?) -> Void)?

    var model: [Movie]? {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(MovieCatalogueViewCell.self, forCellWithReuseIdentifier: MovieCatalogueViewCell.ID)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoviesView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.frame.width / 2.4
        let height = CGFloat(300)

        return CGSize(width: width, height: height)
    }
}

extension MoviesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigateMovieDetail?(model?[indexPath.row])
    }
}

extension MoviesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MovieCatalogueViewCell.ID, for: indexPath) as! MovieCatalogueViewCell
        cell.movie = model?[indexPath.row]
        return cell
    }
}
