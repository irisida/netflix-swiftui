//
//  Trailer.swift
//  netflixclone
//
//  Created by ed on 12/05/2021.
//

import Foundation


struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    
    var name: String
    var videoURL: URL
    var thumbnailImageUrl: URL
    
}
