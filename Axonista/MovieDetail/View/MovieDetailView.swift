//
//  MovieDetailView.swift
//  Axonista
//
//  Created by Norman, ThankaVijay on 06/08/22.
//

import UIKit

final class MovieDetailView: UIView {

    var detail: MovieDetail? {
        didSet {
            if let detail = detail {
                DispatchQueue.main.async {
                    self.coverImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(detail.backdropPath)"))
                    self.movieImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(detail.posterPath)"))
                    self.name.text = detail.originalTitle
                    self.releaseDate.text = "Released: \(detail.releaseDate.ddMMMyyyy)"
                    self.runTime.text = detail.runtime.hms
                    self.journal.text = detail.genres.map{ $0.name }.joined(separator: ", ")
                    self.score.text = String(Int(detail.popularity))
                    self.overViewDesc.text = detail.overview
                }
            }
        }
    }

    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.backgroundColor = UIColor.lightText.cgColor
        return imageView
    }()

    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true

        return imageView
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        return label
    }()

    private let releaseDate: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .white
        return label
    }()

    private let runTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .white
        return label
    }()

    private let journal: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .white
        return label
    }()

    private let score: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.cornerRadius = 17.5
        label.layer.masksToBounds = true
        label.textColor = .white
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 3.0
        label.backgroundColor = .black
        return label
    }()

    private let scoreTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "User Score"
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        return label
    }()

    private let overViewTitle: UILabel = {
        let label = UILabel()
        label.text = "Overiew"
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()

    private let overViewDesc: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {
        translatesAutoresizingMaskIntoConstraintsFalse(forViews: coverImageView, movieImageView, name, releaseDate,
                                                       runTime, journal, score, scoreTitle, overViewTitle, overViewDesc)
        addSubviews(coverImageView, movieImageView, name, releaseDate, runTime, journal, score, scoreTitle,
                    overViewTitle, overViewDesc)

        let coverImageHeight = (frame.size.height/100.0) * 30.0

        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: coverImageHeight),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.heightAnchor.constraint(equalToConstant: 140),
            movieImageView.centerXAnchor.constraint(equalTo: coverImageView.centerXAnchor, constant: -self.frame.size.width/3),
            movieImageView.centerYAnchor.constraint(equalTo: coverImageView.centerYAnchor, constant: 80),
            overViewTitle.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: gap),
            overViewTitle.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 10),
            overViewDesc.topAnchor.constraint(equalTo: overViewTitle.bottomAnchor, constant: 10),
            overViewDesc.leadingAnchor.constraint(equalTo: overViewTitle.leadingAnchor, constant: 10),
            overViewDesc.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -gap),
            overViewDesc.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -gap),
            score.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10),
            score.bottomAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: -10),
            score.widthAnchor.constraint(equalToConstant: 35),
            score.heightAnchor.constraint(equalToConstant: 35),
            scoreTitle.bottomAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: -15),
            scoreTitle.leadingAnchor.constraint(equalTo: score.trailingAnchor, constant: 10),
            journal.leadingAnchor.constraint(equalTo: score.leadingAnchor),
            journal.bottomAnchor.constraint(equalTo: score.topAnchor, constant: -10),
            journal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: gap),
            runTime.leadingAnchor.constraint(equalTo: journal.leadingAnchor),
            runTime.bottomAnchor.constraint(equalTo: journal.topAnchor, constant: -10),
            runTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: gap),
            releaseDate.leadingAnchor.constraint(equalTo: runTime.leadingAnchor),
            releaseDate.bottomAnchor.constraint(equalTo: runTime.topAnchor, constant: -10),
            releaseDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: gap),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: gap),
            name.topAnchor.constraint(equalTo: topAnchor, constant: gap/2),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -gap)
        ])
    }
    
    let gap: CGFloat = 20
}
