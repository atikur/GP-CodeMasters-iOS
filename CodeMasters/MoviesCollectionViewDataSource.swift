//
//  MoviesCollectionViewDataSource.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class MoviesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let movieDataStore = MovieDataStore.shared
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDataStore.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseId, for: indexPath) as! MovieCell

        print(movieDataStore.data[indexPath.item])
        return cell
    }
}
