//
//  MoviewListView.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewmodel = MovieListViewModel()
    var rowCount = 1
//    var columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 80)
//        ]

//    let columns = [
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100)),
//        ]
    var body: some View {
        ScrollViewReader { geometry in
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:UIScreen.main.bounds.size.width / 2 - 10))], alignment: .leading, spacing: 45) {
//                GridRow {
                     if let allMovie = viewmodel.allMovieList, let result = allMovie.results, result.count > 0 {
                        ForEach((1..<(result.count)), id: \.self) { index in
//                             MovieTileView(viewModel: MovieTileViewModel(movieId: result[index].id))
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 10.0)
//                                    .frame(minHeight: 300).padding()
//                                Image(uiImage: UIImage(named: "movie-thumb")!).padding()
                                MovieTileView(viewModel: MovieTileViewModel(movieId: result[index].id))
                                //                                .overlay {
                                //                                    MovieTileView(viewModel: MovieTileViewModel(movieId: result[index].id))
                                //                                }
//                            }
                        }
                    }
                }
            }
        }.onAppear {
            
        }
    }
}
