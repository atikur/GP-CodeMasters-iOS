//
//  TrendingCollectionViewDataSource.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class TrendingCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var trendingList = [Any]()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.reuseId, for: indexPath) as! TrendingCell
        
        let trending = trendingList[indexPath.item]
        if let movie = trending as? Movie {
            cell.identifier = movie.imagePath
        } else if let tvSeries = trending as? TVSeries {
            cell.identifier = tvSeries.imagePath
        }
        cell.configureData(trending: trending)
        
        return cell
    }
}
