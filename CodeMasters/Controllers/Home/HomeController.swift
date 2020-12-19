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
        
        TMDBClient.shared.getPopularMovies { [weak self]
            movies in
            guard let movies = movies else { return }
            self?.moviesDataSource.movies = movies
            DispatchQueue.main.async {
                self?.moviesCollectionView.reloadData()
            }
        }
        
        TMDBClient.shared.getPopularTVSeries { [weak self]
            tvSeriesList in
            guard let tvSeriesList = tvSeriesList else { return }
            self?.tvSeriesDataSource.tvSeriesList = tvSeriesList
            DispatchQueue.main.async {
                self?.tvSeriesCollectionView.reloadData()
            }
        }
        
        TMDBClient.shared.getTrendingContents { [weak self]
            trendingList in
            guard let trendingList = trendingList else { return }
            self?.trendingDataSource.trendingList = trendingList
            DispatchQueue.main.async {
                self?.trendingContentCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - Configure UI
    
    private func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "GP Codemasters"
        
        addMoviesSection()
        addTVSeriesSection()
        addTrendingContentSection()
    }
    
    // MARK: - Movies section
        
    private func addMoviesSection() {
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        
        moviesCollectionView.dataSource = moviesDataSource
        moviesCollectionView.delegate = moviesDelegate
        moviesDelegate.controller = self
        
        view.addSubview(moviesLabel)
        view.addSubview(moviesCollectionView)
        
        moviesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        moviesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        moviesCollectionView.topAnchor.constraint(equalTo: moviesLabel.bottomAnchor, constant: 20).isActive = true
        moviesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        moviesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        moviesCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private let moviesLabel = UILabel.setupLabel(text: "Popular Movies")
    private let moviesCollectionView = UICollectionView.setupCollectionView(scrollDirection: .horizontal)
    
    // MARK: - TV Series section
    
    let tvSeriesDataSource = TVSeriesCollectionViewDataSource()
    let tvSeriesDelegate = TVSeriesCollectionViewDelegate()
    
    private func addTVSeriesSection() {
        tvSeriesCollectionView.register(TVSeriesCell.self, forCellWithReuseIdentifier: TVSeriesCell.reuseId)
        
        tvSeriesCollectionView.dataSource = tvSeriesDataSource
        tvSeriesCollectionView.delegate = tvSeriesDelegate
        tvSeriesDelegate.controller = self
        
        view.addSubview(tvSeriesLabel)
        view.addSubview(tvSeriesCollectionView)
        
        tvSeriesLabel.topAnchor.constraint(equalTo: moviesCollectionView.bottomAnchor, constant: 20).isActive = true
        tvSeriesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tvSeriesCollectionView.topAnchor.constraint(equalTo: tvSeriesLabel.bottomAnchor, constant: 20).isActive = true
        tvSeriesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tvSeriesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tvSeriesCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private let tvSeriesLabel = UILabel.setupLabel(text: "Popular TV Series")
    private let tvSeriesCollectionView = UICollectionView.setupCollectionView(scrollDirection: .horizontal)
    
    // MARK: - Trending Content section
    
    let trendingDataSource = TrendingCollectionViewDataSource()
    let trendingDelegate = TrendingCollectionViewDelegate()
    
    private func addTrendingContentSection() {
        trendingContentCollectionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.reuseId)
        
        trendingContentCollectionView.dataSource = trendingDataSource
        trendingContentCollectionView.delegate = trendingDelegate
        trendingDelegate.controller = self
        
        view.addSubview(trendingContentLabel)
        view.addSubview(trendingContentCollectionView)
        
        trendingContentLabel.topAnchor.constraint(equalTo: tvSeriesCollectionView.bottomAnchor, constant: 20).isActive = true
        trendingContentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        trendingContentCollectionView.topAnchor.constraint(equalTo: trendingContentLabel.bottomAnchor, constant: 20).isActive = true
        trendingContentCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        trendingContentCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        trendingContentCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    private let trendingContentLabel = UILabel.setupLabel(text: "Trending Content")
    private let trendingContentCollectionView = UICollectionView.setupCollectionView(scrollDirection: .vertical)
}
