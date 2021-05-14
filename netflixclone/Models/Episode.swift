//
//  Episode.swift
//  netflixclone
//
//  Created by ed on 09/05/2021.
//

import Foundation
import SwiftUI

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var episodeNumber: Int
    var thumbnailImageUrlString: String
    var description: String
    var length: Int
    
    var videoUrl: URL
    
    
    var thumbnailUrl: URL {
        return URL(string: thumbnailImageUrlString)!
    }
}
