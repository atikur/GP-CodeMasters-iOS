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
        
        addMoviesCollectionView()
    }
    
    private func addMoviesCollectionView() {
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        
        moviesCollectionView.dataSource = moviesDataSource
        moviesCollectionView.delegate = moviesDelegate
        
        view.addSubview(moviesCollectionView)
        moviesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        moviesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        moviesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        moviesCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
}
