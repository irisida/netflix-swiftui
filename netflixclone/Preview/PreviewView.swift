//
//  PreviewView.swift
//  netflixclone
//
//  Created by ed on 20/05/2021.
//

import SwiftUI

struct PreviewView: View {
    
    @ObservedObject var viewModel: PreviewViewModel
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(videoUrl: viewModel.movie.trailers.first?.videoURL,
                              playVideo: .constant(true))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(viewModel.movie.name)
                            .foregroundColor(viewModel.movie.accentColor)
                            .bold()
                            .font(.largeTitle)
                        
                    }
                    
                    Spacer()
                    
                    
                }
                .padding(.leading, 16)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<viewModel.movie.categories.count) { catIndex in
                        let category = viewModel.movie.categories[catIndex]
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if catIndex != viewModel.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 4))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List",
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        color: viewModel.movie.accentColor,
                                        isOn: true) {
                                            //
                                        }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 24)
                        .border(viewModel.movie.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info",
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        color: viewModel.movie.accentColor,
                                        isOn: true) {
                                            //
                                        }
                    
                    Spacer()
                }
                .padding(.top, 16)
                
            }
            .padding(.bottom, 24)
            .foregroundColor(viewModel.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(viewModel: PreviewViewModel(movie: exampleMovie9))
    }
}
