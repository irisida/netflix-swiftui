//
//  PreviewViewModel.swift
//  netflixclone
//
//  Created by ed on 20/05/2021.
//

import Foundation

class PreviewViewModel: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
