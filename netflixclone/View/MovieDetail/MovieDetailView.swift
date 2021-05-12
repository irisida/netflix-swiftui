//
//  MovieDetailView.swift
//  netflixclone
//
//  Created by ed on 09/05/2021.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // closing view action
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 30))
                    })
                }.padding(.horizontal, 16)
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                    VStack{
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5 )
                        
                        MovieInfoSubHeadline(movie: movie)
                        
                        if movie.promotionalText != nil {
                            Text(movie.promotionalText!)
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            // TODO
                        }
                        
                        
                        CurrentEpisodeInformation(movie: movie)
                        
                        // creators and cast
                        CastInfoSubView(movie: movie)
                        
                        HStack(spacing: screen.width / 6) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                // TODO
                            }
                            
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: false) {
                                // TODO
                            }
                            
                            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: false) {
                                // TODO
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: movie)
                        
                        
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie6)
    }
}

struct MovieInfoSubHeadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingSubView(rating: movie.rating)
            
            Text(movie.numberofSeasonsDisplay)
            
            formatSubView()
        }
        .foregroundColor(.gray)
        .padding(.vertical, 8)
    }
}

struct RatingSubView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(CGColor.init(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)))
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct formatSubView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(CGColor.init(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)))
                .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 2))
            
            
            
            Text("HD")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 35, height: 20)
    }
}

struct CastInfoSubView: View {
    var movie: Movie
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Cast: \(movie.cast)")
                
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
