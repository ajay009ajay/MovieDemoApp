//
//  MovieList.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import Foundation

// MARK: - Welcome
struct MovieList: Codable {
    let results: [Result]
    let page, totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let adult: Bool
}
