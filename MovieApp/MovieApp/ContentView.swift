//
//  ContentView.swift
//  MovieApp
//
//  Created by Admin on 20/01/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var list = MovieListViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
