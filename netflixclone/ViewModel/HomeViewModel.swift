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
        movies["Trending Now"] = exampleMovies
    }
}
