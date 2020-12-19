//
//  Constants.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

extension TMDBClient {
    
    struct Constants {
        static let ApiKey = "a6778b2e57ae15de97c99f068785d871"
        static let ApiScheme = "https"
        static let ApiHost = "api.themoviedb.org"
        static let ApiPath = "/3"
    }
    
    struct Methods {
        static let PopularMovie = "/discover/movie"
        static let PopularTVSeries = "/discover/tv"
        static let Trending = "/trending/all/week"
    }
    
    struct JSONResponseKeys {
        static let Title = "title"
        static let Name = "name"
        static let FirstAirDate = "first_air_date"
        static let ReleaseDate = "release_date"
        static let Rating = "vote_average"
        static let ImagePath = "poster_path"
    }
}
