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
    
    public var allGenres: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Drama, .Horror, .SciFi, .Thriller] 
    
    init() {
        setupMovies()
    }
    
    public func getMovie(forCategory category: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return (movies[category] ?? [])
        case .movies:
            return (movies[category] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[category] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            // TODO
            return (movies[category] ?? [])
        }
    }
    
    
//    func setupMovies() {
//        movies["Trending Now"] = setupMoviesShuffled.shuffled()
//        movies["Comedies"] = setupMoviesShuffled.shuffled()
//        movies["Action"] = setupMoviesShuffled.shuffled()
//        movies["watch it again"] = setupMoviesShuffled.shuffled()
//        movies["Thriller"] = setupMoviesShuffled.shuffled()
//        movies["Sci-Fi Movies"] = setupMoviesShuffled.shuffled()
//    }
    
    // working with mock data version n lieu of a functional backend
    func setupMovies() {
        movies["Trending Now"] = generateMovies(8).shuffled()
        movies["Comedies"] = generateMovies(8).shuffled()
        movies["Action"] = generateMovies(8).shuffled()
        movies["watch it again"] = generateMovies(8).shuffled()
        movies["Thriller"] = generateMovies(8).shuffled()
        movies["Sci-Fi Movies"] = generateMovies(8).shuffled()
    }
}
