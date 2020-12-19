//
//  TVSeriesCollectionViewDataSource.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class TVSeriesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var tvSeriesList = [TVSeries]()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvSeriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVSeriesCell.reuseId, for: indexPath) as! TVSeriesCell
        
        let tvSeries = tvSeriesList[indexPath.item]
        cell.identifier = tvSeries.imagePath
        cell.configureData(tvSeries: tvSeries)
        
        return cell
    }
}
