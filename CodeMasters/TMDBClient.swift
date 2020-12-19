//
//  TMDBClient.swift
//  CodeMasters
//
//  Created by Atikur Rahman on 19/12/20.
//

import UIKit

class TMDBClient : NSObject {
    
    func getPopularMovies(completion: @escaping ([Movie]?) -> ()) {
        guard let url = getURL(for: TMDBClient.Methods.PopularMovie) else { return }
        
        performGetRequest(url: url) { (data) in
            var parsedResult: AnyObject!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
                
                guard let results = parsedResult["results"] as? [[String: Any]] else {
                    completion(nil)
                    return
                }
                
                let movies = results.compactMap {Movie(dict: $0)}
                completion(movies)
            } catch {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getPopularTVSeries(completion: @escaping ([TVSeries]?) -> ()) {
        guard let url = getURL(for: TMDBClient.Methods.PopularTVSeries) else { return }
        
        performGetRequest(url: url) { (data) in
            var parsedResult: AnyObject!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
                
                guard let results = parsedResult["results"] as? [[String: Any]] else {
                    completion(nil)
                    return
                }
                
                let tvSeries = results.compactMap {TVSeries(dict: $0)}
                completion(tvSeries)
            } catch {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getTrendingContents(completion: @escaping ([Any]?) -> ()) {
        guard let url = getURL(for: TMDBClient.Methods.Trending) else { return }
        
        performGetRequest(url: url) { (data) in
            var parsedResult: AnyObject!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
                
                guard let results = parsedResult["results"] as? [[String: Any]] else {
                    completion(nil)
                    return
                }
                
                var contents = [Any]()
                results.forEach { dict in
                    if let movie = Movie(dict: dict) {
                        contents.append(movie)
                    } else if let tvSeries = TVSeries(dict: dict) {
                        contents.append(tvSeries)
                    }
                }
                
                completion(contents)
            } catch {
                print(error)
                completion(nil)
            }
        }
    }
    
    func performGetRequest(url: URL, completionHandler: @escaping (Data) -> ()) {
        let defaultSession = URLSession(configuration: .default)
        let dataTask =
            defaultSession.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data,
                   let response = response as? HTTPURLResponse,
                   response.statusCode == 200 {
                    completionHandler(data)
                }
            }
        
        dataTask.resume()
    }
    
    private func getURL(for method: String) -> URL? {
        var components = URLComponents()
        components.scheme = TMDBClient.Constants.ApiScheme
        components.host = TMDBClient.Constants.ApiHost
        components.path = TMDBClient.Constants.ApiPath + method
        components.queryItems = [URLQueryItem]()
        components.queryItems?.append(URLQueryItem(name: "api_key", value: TMDBClient.Constants.ApiKey))
        return components.url
    }
    
    // MARK: - Singleton
    
    static let shared = TMDBClient()
    
    private override init() {}
}
