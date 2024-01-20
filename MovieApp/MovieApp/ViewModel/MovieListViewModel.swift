//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    init() {
        getAllMoviewList()
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
                print("\(parsedData)")
            }
        }.resume()

    }
}
