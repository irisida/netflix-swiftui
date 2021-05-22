//
//  MoviePreviewRow.swift
//  netflixclone
//
//  Created by ed on 19/05/2021.
//

import SwiftUI

struct MoviePreviewRow: View {
    var movies: [Movie]
    
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 8)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                         
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 16)
                            .padding(.leading, 4)
                            .onTapGesture(perform: {
                                previewStartingIndex = movieIndex
                                showPreviewFullScreen = true
                            })
                    
                    }
                }
            }
        }
        .frame(height: 180)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: previewMovies,
                            showPreviewFullScreen: .constant(false),
                            previewStartingIndex: .constant(0))
        }
    }
}
