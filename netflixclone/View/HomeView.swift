//
//  HomeView.swift
//  netflixclone
//
//  Created by ed on 07/05/2021.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack  {
            // set the app background to black
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView (showsIndicators: false) {
                
                // Main Vstack for the app.
                LazyVStack {
                    
                    // Give loop an id of self as we can
                    // guarantee that each category of
                    // our array will be unique.
                    ForEach(viewModel.allCategories, id: \.self ) {category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewModel.getMovie(forCategory: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 16)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
