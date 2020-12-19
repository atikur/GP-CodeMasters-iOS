//
//  Movie.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String
    let rating: Double
    let imagePath: String
    
    init?(dict: [String: Any]) {
        title = (dict[TMDBClient.JSONResponseKeys.Title] as? String) ?? ""
        releaseDate = (dict[TMDBClient.JSONResponseKeys.ReleaseDate]  as? String) ?? ""
        rating = dict[TMDBClient.JSONResponseKeys.Rating] as? Double ?? 0.0
        imagePath = (dict[TMDBClient.JSONResponseKeys.ImagePath] as? String) ?? ""
        
        guard !title.isEmpty && !releaseDate.isEmpty &&
                rating != 0.0 && !imagePath.isEmpty else {
            return nil
        }
    }
}
