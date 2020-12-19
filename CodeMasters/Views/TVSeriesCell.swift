//
//  TVSeriesCell.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class TVSeriesCell: UICollectionViewCell {
    
    static let reuseId = String(describing: TVSeriesCell.self)
    
    var identifier: String!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        releaseYearLabel.text = ""
        ratingLabel.text = ""
        imageView.image = nil
    }
    
    func configureData(tvSeries: TVSeries) {
        titleLabel.text = tvSeries.name
        releaseYearLabel.text = "Released: \(tvSeries.firstAirDate)"
        ratingLabel.text = "Rating: \(tvSeries.rating)"
        
        imageView.loadImage(filePath: tvSeries.imagePath, identifier: identifier)
    }
    
    private func setupViews() {
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
        releaseYearLabel.textColor = .white
        ratingLabel.textColor = .white
        
        addSubview(imageView)
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor(white: 0.1, alpha: 0.4)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgView)
        
        let infoStackView = UIStackView(arrangedSubviews: [
            titleLabel, ratingLabel, releaseYearLabel
        ])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 0
        infoStackView.axis = .vertical
        addSubview(infoStackView)
        
        infoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgView.heightAnchor.constraint(equalToConstant: 81).isActive = true
   
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
        iv.backgroundColor = .lightGray
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
}
