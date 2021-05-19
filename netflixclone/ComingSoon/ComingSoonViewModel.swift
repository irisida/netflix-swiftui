//
//  ComingSoonViewModel.swift
//  netflixclone
//
//  Created by ed on 19/05/2021.
//

import Foundation


class ComingSoonViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(40)
    }
}
