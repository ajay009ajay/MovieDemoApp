//
//  MovieTileViewModel.swift
//  MovieApp
//
//  Created by Admin on 21/01/24.
//

import Foundation
import Combine
import SwiftUI

class MovieTileViewModel: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []
    @Published var imageViewModel: ImageViewModel?
    @Published var image: UIImage?

    private let networkService = NetworkService()
    @Published var loading = LoadingStatus.none
    @Published var movie: Movie?

    init(movieId: Int) {
        print("movieId : \(movieId)")
        getMovieList(movieId: movieId)
//        getMovieListSession(movieId: movieId)
    }
    
    func getMovieListSession(movieId: Int) {
        let urlStr = String(format: ApiName.movieDetailApi.rawValue, movieId)
        guard let url = URL(string: urlStr) else {
            return
        }
        self.loading = .loading
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.addValue("Bearer \(Constants.apiReadAccessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
            }
            if let data = data {
                let parsedData = try? JSONDecoder().decode(Movie.self, from: data)
                if parsedData == nil {
                    print("\(response?.url)")
                }
                DispatchQueue.main.async {
                    self.loading = .loaded
                    self.movie = parsedData
                }
            }
        }.resume()

    }
    
    func getMovieList(movieId: Int?) {
        guard let movieId = movieId else {
            return
        }
        self.loading = .loading
        NetworkService().getMovieDetailData(moviewId: movieId)?
        .sink(receiveCompletion: { _ in
            self.loading = LoadingStatus.loaded
        }, receiveValue: { movie in
            self.movie = movie
            if let poster = movie?.posterPath {
                self.imageViewModel =  ImageViewModel(urlString:"https://image.tmdb.org/t/p/w500/\(poster)", completion: { image in
                    self.image = image
                })
            } else {
                self.image = UIImage(named: "movie-thumb")
            }
            //https://image.tmdb.org/t/p/w500/oFF6LVYQnx7xoa11DRoSDV02OlB.jpg
        })
        .store(in: &cancellableSet)
    }
}
