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

extension UIActivityIndicatorView {
    
    static func setupActivityIndicator() -> UIActivityIndicatorView {
        let av = UIActivityIndicatorView(style: .gray)
        av.translatesAutoresizingMaskIntoConstraints = false
        return av
    }
}
