//
//  MovieCell.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseId = String(describing: MovieCell.self)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(movie: Movie) {
        titleLabel.text = movie.title
        releaseYearLabel.text = "Released: \(movie.releaseDate)"
        ratingLabel.text = "Rating: \(movie.rating)"
    }
    
    private func setupViews() {
        titleLabel.adjustsFontSizeToFitWidth = true
        
        addSubview(imageView)
        
        let infoStackView = UIStackView(arrangedSubviews: [
            titleLabel, releaseYearLabel, ratingLabel
        ])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 5
        infoStackView.axis = .vertical
        addSubview(infoStackView)
        
        infoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
   
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    private let titleLabel = UILabel.setupLabel(text: "Movie Title")
    private let releaseYearLabel = UILabel.setupLabel(text: "Released in: 2020")
    private let ratingLabel = UILabel.setupLabel(text: "Rating: 5.5/10")
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
}
