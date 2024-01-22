//
//  Constants.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import Foundation

struct Constants {
    static let apiKey = "5f721b8a035bdcfeb177496ff761df4f"
    static let apiReadAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZjcyMWI4YTAzNWJkY2ZlYjE3NzQ5NmZmNzYxZGY0ZiIsInN1YiI6IjVkOTg4ZjJjYjA0NjA1MDAyMjQyN2Y2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._ESZvy9Wz7qAf6NhvgkQgOLMYHY7ndBOXVn19aa1oZI"
}

enum ApiName: String {
    case movieListApi = "https://api.themoviedb.org/3/movie/changes?page=1"
    case movieDetailApi = "https://api.themoviedb.org/3/movie/%d?language=en-US"
}

enum NetworkError: Error {
    case apiError(String)
    case dataformtError
}

enum LoadingStatus {
    case loading
    case loaded
    case none
}
