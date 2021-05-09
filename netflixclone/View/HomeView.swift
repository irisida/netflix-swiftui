//
//  HomeView.swift
//  netflixclone
//
//  Created by ed on 07/05/2021.
//

import SwiftUI

struct HomeView: View {
    var viewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack  {
            // set the app background to black
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView (showsIndicators: false) {
                
                // Main Vstack for the app.
                LazyVStack {
                    
                    TopRowButtons()
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    // Give loop an id of self as we can
                    // guarantee that each category of
                    // our array will be unique.
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
                                    ForEach(viewModel.getMovie(forCategory: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
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

// top row buttons subview contains the Home/Logo
// tv shows, Movies and My list main menu options.
struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                // action
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.leading, 16)
            
            Spacer()
            
            Button(action: {
                // action
            }, label: {
                Text("TV Shows")
            })
            .buttonStyle(PlainButtonStyle())
            
            
            Spacer()
            
            Button(action: {
                // action
            }, label: {
                Text("Movies")
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                // action
            }, label: {
                Text("My List")
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 32)
        }
        .background(Color.black.opacity(0.05))
    }
}
