//
//  ImageCache.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImage(filePath: String, identifier: String) {
        let urlStr = "https://image.tmdb.org/t/p/w200/\(filePath)"
        guard let url = URL(string: urlStr) else { return }
        
        if let imageFromCache = imageCache.object(forKey: filePath as AnyObject) as? UIImage {
            image = imageFromCache
            return
        }
        
        TMDBClient.shared.performGetRequest(url: url) { [weak self] (data) in
            // cache image
            if let imageToCache = UIImage(data: data){
                imageCache.setObject(imageToCache, forKey: filePath as AnyObject)
            }
            
            DispatchQueue.main.async {
                // make sure we are using correct image for the cell
                if filePath == identifier {
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
}
