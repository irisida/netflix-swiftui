//
//  HomeViewModel.swift
//  netflixclone
//
//  Created by ed on 08/05/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // String acts as the category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    init() {
        setupMovies()
    }
    
    public func getMovie(forCategory category: String) -> [Movie] {
        return  movies[category] ?? []
    }
    
    
    func setupMovies() {
        movies["Trending Now"] = exampleMoviesGroup1.shuffled()
        movies["Comedies"] = exampleMoviesGroup1.shuffled()
        movies["Action"] = exampleMoviesGroup1.shuffled()
        movies["watch it again"] = exampleMoviesGroup1.shuffled()
        movies["Thriller"] = exampleMoviesGroup1.shuffled()
        movies["Sci-Fi Movies"] = exampleMoviesGroup1.shuffled()
    }
}
