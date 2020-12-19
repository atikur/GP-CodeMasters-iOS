//
//  CodeMastersTests.swift
//  CodeMastersTests
//
//  Created by Atikur Rahman on 19/12/20.
//

import XCTest
@testable import CodeMasters

class CodeMastersTests: XCTestCase {
    
    var tmdbClient: TMDBClient!

    override func setUpWithError() throws {
        tmdbClient = TMDBClient.shared
    }

    override func tearDownWithError() throws {
        tmdbClient = nil
    }

    func testUrlForPopularMovie() {
        guard let returnedUrl = tmdbClient.getURL(for: TMDBClient.Methods.PopularMovie) else {
            XCTFail("Expected a valid url from the method.")
            return
        }
        
        guard let staticUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(TMDBClient.Constants.ApiKey)") else {
            XCTFail("Expected a valid url from static string.")
            return
        }
        
        XCTAssertEqual(returnedUrl, staticUrl)
    }

}
