//
//  MovieCatalogueViewCell.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import UIKit
import Kingfisher

protocol ReusableView: AnyObject {
    static var ID: String { get }
}

class MovieCatalogueViewCell: UICollectionViewCell {

    var movie: Movie? {
        didSet {
            if let movie = movie {
                movieImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)"))
                movieName.text = movie.originalTitle
                movieReleaseDate.text = movie.releaseDate.ddMMMyyyy
                movieLikePercentage.text = String(Int(movie.popularity))
            }
        }
    }

    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true

        return imageView
    }()

    private let movieName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()

    private let movieReleaseDate: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()

    private let movieLikePercentage: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 3.0

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {
        translatesAutoresizingMaskIntoConstraintsFalse(forViews: movieImageView,
                                                       movieName,
                                                       movieReleaseDate,
                                                       movieLikePercentage)
        addSubviews(movieImageView, movieName, movieReleaseDate, movieLikePercentage)

        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            movieName.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 25),
            movieName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            movieReleaseDate.topAnchor.constraint(equalTo: movieName.bottomAnchor),
            movieReleaseDate.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieReleaseDate.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieLikePercentage.centerXAnchor.constraint(equalTo: movieImageView.centerXAnchor,
                                                         constant: -50),
            movieLikePercentage.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor,
                                                         constant: 100),
            movieLikePercentage.widthAnchor.constraint(equalToConstant: 50),
            movieLikePercentage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension MovieCatalogueViewCell: ReusableView {
    static var ID: String {
        return String(describing: self)
    }
}
