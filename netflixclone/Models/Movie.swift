//
//  Movie.swift
//  netflixclone
//
//  Created by ed on 08/05/2021.
//

import SwiftUI


struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    // movieDetailView
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?
    
    var promotionalText: String?
    
    var numberofSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 Season"
            } else {
                return "\(num) Seasons"
            }
        }
        
        // No seasons
        return ""
    }
}
