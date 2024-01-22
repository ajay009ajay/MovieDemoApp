//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    var arr = [1,2,4,2,5,9]
    @Published var allMovieList: MovieList?
    @Published var movieArr = [Movie]()
    
    var cancellableSet: Set<AnyCancellable> = []
    
    private let networkService = NetworkService()
    
    init() {
//        getAllMoviewList()
        getMovieList()
//        getMovieDetail()
    }
    func getAllMoviewList() {
        let session = URLSession(configuration: .default)        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/changes?page=1")!)
        request.addValue("Bearer \(Constants.apiReadAccessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error \(error)")
            }
            if let data = data {
                let parsedData = try? JSONDecoder().decode(MovieList.self, from: data)
            }
        }.resume()

    }
    
    func getMovieDetail() {
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/1233573?language=en-US")!)
        request.addValue("Bearer \(Constants.apiReadAccessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error \(error)")
            }
            if let data = data {
                do {
                    let parsedData = try JSONDecoder().decode(Movie.self, from: data)
                    print("\(parsedData)")
                    } catch {
                    print("\(error)")
                }
            }
        }.resume()
    }
    
    func getMovieList() {
        NetworkService().getAllMovieList()?
        .sink(receiveCompletion: { _ in
            print("Completed")
        }, receiveValue: { movieList in
            self.allMovieList = movieList
        })
        .store(in: &cancellableSet)
    }
}
