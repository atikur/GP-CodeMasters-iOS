//
//  TVSeries.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import Foundation

struct TVSeries {
    let name: String
    let firstAirDate: String
    let rating: Double
    let imagePath: String
    
    init?(dict: [String: Any]) {
        name = (dict[TMDBClient.JSONResponseKeys.Name] as? String) ?? ""
        firstAirDate = (dict[TMDBClient.JSONResponseKeys.FirstAirDate]  as? String) ?? ""
        rating = dict[TMDBClient.JSONResponseKeys.Rating] as? Double ?? 0.0
        imagePath = (dict[TMDBClient.JSONResponseKeys.ImagePath] as? String) ?? ""
        
        guard !name.isEmpty && !firstAirDate.isEmpty &&
                rating != 0.0 && !imagePath.isEmpty else {
            return nil
        }
    }
}
