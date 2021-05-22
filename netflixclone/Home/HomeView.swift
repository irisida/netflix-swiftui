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
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    
    @State private var showTopRowSelection = false
    
    @Binding var showPreviewFullScreen: Bool
    
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ZStack  {
            // set the app background to black
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView (showsIndicators: false) {
                
                // Main Vstack for the app.
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection,
                                  homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection,
                                  showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: topPromoMovies.randomElement()!)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    MoviePreviewRow(movies: previewMovies,
                                    showPreviewFullScreen: $showPreviewFullScreen,
                                    previewStartingIndex: $previewStartingIndex)
                    
                    HomeStack(viewModel: viewModel,
                              topRowSelection: topRowSelection,
                              selectedGenre: homeGenre,
                              movieDetailToShow: $movieDetailToShow,
                              showPreviewFullScreen: $showPreviewFullScreen,
                              previewStartingIndex: $previewStartingIndex)
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetailView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                if topRow == topRowSelection {
                                    Text(topRow.rawValue)
                                        .bold()
                                } else {
                                    Text(topRow.rawValue)
                                        .bold()
                                        .foregroundColor(.gray)
                                }
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))                            
                        })
                        .padding(.bottom, 32)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ScrollView {
                            ForEach(viewModel.allGenres, id: \.self) { genre in
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {
                                    if genre == homeGenre {
                                        Text(genre.rawValue)
                                            .bold()
                                    } else {
                                        Text(genre.rawValue)
                                            .bold()
                                            .foregroundColor(.gray)
                                    }
                                })
                                .padding(.bottom, 40)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 32)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showPreviewFullScreen: .constant(false),
                 previewStartingIndex: .constant(0))
    }
}

// top row buttons subview contains the Home/Logo
// tv shows, Movies and My list main menu options.
struct TopRowButtons: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
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
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 32)
            }
            .background(Color.black.opacity(0.05))
            
        case .tvShows, .movies, .myList:
            //
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 16)
                
                
                HStack(spacing: 32) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 8))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 14))
                            
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 8))
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                }.padding(.leading, 24)
                
            }
            .background(Color.black.opacity(0.05))
        }
        
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case SciFi
    case Drama
    case Thriller
    
}

