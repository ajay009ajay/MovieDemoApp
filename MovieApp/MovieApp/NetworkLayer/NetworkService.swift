//
//  NetworkService.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import Foundation
import Combine

struct NetworkService {
    func getAllMovieList() -> AnyPublisher<MovieList?, Error>? {
        guard let url = URL(string: ApiName.movieListApi.rawValue) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(Constants.apiReadAccessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        return APIClient().handleRequest(urlRequest: request, type: MovieList.self)
    }
    func getMovieDetailData(moviewId: Int) -> AnyPublisher<Movie?, Error>? {
        let urlStr = String(format: ApiName.movieDetailApi.rawValue, moviewId)
        guard let url = URL(string: urlStr) else {
            return nil
        }
        print("UrL: \(url)")
        var request = URLRequest(url: url)
        request.addValue("Bearer \(Constants.apiReadAccessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        return APIClient().handleRequest(urlRequest: request, type: Movie.self)
    }
}
