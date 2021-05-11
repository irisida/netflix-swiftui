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
        movies["Trending Now"] = exampleMovies1.shuffled()
        movies["Comedies"] = exampleMovies1.shuffled()
        movies["Action"] = exampleMovies1.shuffled()
        movies["watch it again"] = exampleMovies1.shuffled()
        movies["Thriller"] = exampleMovies1.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies1.shuffled()
    }
}
