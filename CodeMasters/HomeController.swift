//
//  HomeController.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class HomeController: UIViewController {
    
    let moviesDataSource = MoviesCollectionViewDataSource()
    let moviesDelegate = MoviesCollectionViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Configure UI
    
    private func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "GP Codemasters"
        
        addMoviesSection()
        addTVSeriesSection()
    }
    
    // MARK: - Movies section
        
    private func addMoviesSection() {
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        
        moviesCollectionView.dataSource = moviesDataSource
        moviesCollectionView.delegate = moviesDelegate
        
        view.addSubview(moviesLabel)
        view.addSubview(moviesCollectionView)
        
        moviesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        moviesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        moviesCollectionView.topAnchor.constraint(equalTo: moviesLabel.bottomAnchor, constant: 20).isActive = true
        moviesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        moviesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        moviesCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private let moviesLabel = UILabel.setupLabel(text: "Popular Movies")
    private let moviesCollectionView = UICollectionView.setupCollectionView(scrollDirection: .horizontal)
    
    // MARK: - TV Series section
    
    private func addTVSeriesSection() {
        tvSeriesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        
        tvSeriesCollectionView.dataSource = moviesDataSource
        tvSeriesCollectionView.delegate = moviesDelegate
        
        view.addSubview(tvSeriesLabel)
        view.addSubview(tvSeriesCollectionView)
        
        tvSeriesLabel.topAnchor.constraint(equalTo: moviesCollectionView.bottomAnchor, constant: 20).isActive = true
        tvSeriesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tvSeriesCollectionView.topAnchor.constraint(equalTo: tvSeriesLabel.bottomAnchor, constant: 20).isActive = true
        tvSeriesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tvSeriesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tvSeriesCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private let tvSeriesLabel = UILabel.setupLabel(text: "Popular TV Series")
    private let tvSeriesCollectionView = UICollectionView.setupCollectionView(scrollDirection: .horizontal)
}

extension UILabel {
    
    static func setupLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

extension UICollectionView {
    
    static func setupCollectionView(scrollDirection: UICollectionView.ScrollDirection) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }
}
