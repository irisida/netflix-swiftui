//
//  PopularMovieView.swift
//  netflixclone
//
//  Created by ed on 18/05/2021.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    var movie: Movie
    
    @Binding var movieDetailToshow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 4)
                    
                
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    // play movie
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 16)
            }
            .foregroundColor(.white)
            .onTapGesture(perform: {
                self.movieDetailToshow = movie 
            })
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PopularMovieView(movie: exampleMovie1, movieDetailToshow: .constant(nil))
                .frame(height: 75)
                //.padding(.horizontal, 48)
        }
    }
}
