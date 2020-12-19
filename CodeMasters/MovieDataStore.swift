//
//  MovieDataStore.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

class MovieDataStore {
    
    static let shared = MovieDataStore()
        
    var data: [String] = [
      "Movie 1", "Movie 2", "Movie 3", "Movie 4", "Movie 5", "Movie 6"
    ]
    
    private init() {}
}
