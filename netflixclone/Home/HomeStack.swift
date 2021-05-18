//
//  HomeStack.swift
//  netflixclone
//
//  Created by ed on 15/05/2021.
//

import Foundation
import SwiftUI


// Give loop an id of self as we can
// guarantee that each category of
// our array will be unique.

struct HomeStack: View {
    var viewModel: HomeViewModel
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ForEach(viewModel.allCategories, id: \.self ) {category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack (spacing: 8) {
                        ForEach(viewModel.getMovie(forCategory: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 120, height: 160)
                                .clipped()
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HomeStack(viewModel: HomeViewModel(), topRowSelection: HomeTopRow.home, selectedGenre: HomeGenre.AllGenres, movieDetailToShow: .constant(exampleMovie1))
            }
        }
        .foregroundColor(.white)
    }
}
