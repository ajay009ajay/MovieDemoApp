//
//  MovieTileView.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import SwiftUI

struct MovieTileView: View {
    @ObservedObject var viewModel: MovieTileViewModel

    var percentage: CGFloat = 89.5
    @State var thumbImage: String = ""
    var movieName: String = "The Marvels"
    var releaeDate = "Nov 08, 2023"
    private var posterImage = UIImage(named: "movie-thumb")
    
    init(viewModel: MovieTileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.loading {
            case .loading:
                imageView
            EmptyView()
            case .loaded:
            tileView
            case .none:
                EmptyView()
        }
    }
    
    @ViewBuilder
    var imageView: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: UIScreen.main.bounds.size.width / 2 - 10, height: 200)
                }
            .frame(height: 200)
    }
    @ViewBuilder
    var tileView: some View {
        VStack {
            HStack {
                Image(uiImage: viewModel.image ?? UIImage())
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .cornerRadius(10)
                    .border(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
            }.frame(width: UIScreen.main.bounds.size.width / 2 - 10, height: 200)
            ZStack(alignment: .top) {
                Circle()
                    .frame(width: 50)
                Circle()
                    .trim(from: 0, to: CGFloat(viewModel.movie?.popularity ?? 0)/10)
                    .stroke(Color.green, lineWidth: 5)
                    .frame(width: 50)
                Text("\(Int(CGFloat(viewModel.movie?.popularity ?? 0)))%")
                    .foregroundColor(Color.white)
                    .padding()
            }
            .padding(.leading, -60)
            .padding(.bottom, 0)
            .padding(.top, -50)

            Text(viewModel.movie?.originalTitle ?? "Test")
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .bold()
            Text(viewModel.movie?.releaseDate ?? "Test")
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.gray)
            
        }
    }
}
