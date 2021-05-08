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
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // id of self as we can guarantee each
            // category entry will be unique.
            ForEach(viewModel.allCategories, id: \.self ) {category in
                VStack {
                    HStack {
                        Text(category)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
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
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
