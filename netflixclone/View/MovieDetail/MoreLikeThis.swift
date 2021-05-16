//
//  MoreLikeThis.swift
//  netflixclone
//
//  Created by ed on 12/05/2021.
//

import SwiftUI

struct MoreLikeThis: View {
    var movies: [Movie]
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0 ..< movies.count) { index in
                StandardHomeMovie(movie: movies[index])
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            MoreLikeThis(movies: moreLikeThisExamples)
        }
        
    }
}
