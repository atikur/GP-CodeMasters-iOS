//
//  UIKit+Extensions.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

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

extension UIImageView {
    func loadImage(filePath: String, identifier: String) {
        let urlStr = "https://image.tmdb.org/t/p/w200/\(filePath)"
        guard let url = URL(string: urlStr) else { return }
        
        TMDBClient.shared.performGetRequest(url: url) { [weak self] (data) in
            DispatchQueue.main.async {
                // make sure we are using correct image for the cell
                if filePath == identifier {
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
}
