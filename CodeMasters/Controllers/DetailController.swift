//
//  DetailController.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class DetailController: UIViewController {
    
    var content: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureData()
        
        favoriteButton.addTarget(self, action: #selector(handleFavorite), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func handleFavorite() {
        if favoriteButton.titleLabel?.text == "Add to Favorites" {
            favoriteButton.setTitle("Remove from Favorites", for: .normal)
        } else {
            favoriteButton.setTitle("Add to Favorites", for: .normal)
        }
    }
    
    // MARK: - Helpers
    
    func configureData() {
        var movie: Movie?
        var tvSeries: TVSeries?
        
        if let content = content as? Movie {
            movie = content
        } else if let content = content as? TVSeries {
            tvSeries = content
        }
        
        let title = (movie?.title ?? tvSeries?.name) ?? ""
        let releaseDate = (movie?.releaseDate ?? tvSeries?.firstAirDate) ?? ""
        let rating = (movie?.rating ?? tvSeries?.rating) ?? 0.0
        let imgPath = (movie?.imagePath ?? tvSeries?.imagePath) ?? ""
        
        titleLabel.text = title
        releaseYearLabel.text = "Released: \(releaseDate)"
        ratingLabel.text = "Rating: \(rating)"
        
        downloadImage(filePath: imgPath) { [weak self] (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
    }
    
    func downloadImage(filePath: String, completion: @escaping (UIImage?) -> ()) {
        let urlStr = "https://image.tmdb.org/t/p/w200/\(filePath)"
        guard let url = URL(string: urlStr) else { return }
        
        TMDBClient.shared.performGetRequest(url: url) { (data) in
            completion(UIImage(data: data))
        }
    }
    
    // MARK: - Configure UI
    
    private func setupViews() {
        view.backgroundColor = .white
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        releaseYearLabel.textAlignment = .center
        ratingLabel.textAlignment = .center
        
        view.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
        let infoStackView = UIStackView(arrangedSubviews: [
            titleLabel, releaseYearLabel, ratingLabel, favoriteButton
        ])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 0
        infoStackView.axis = .vertical
        view.addSubview(infoStackView)
        
        infoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        infoStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
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
    
    private let favoriteButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add to Favorites", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
}
