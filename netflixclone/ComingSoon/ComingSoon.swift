//
//  ComingSoon.swift
//  netflixclone
//
//  Created by ed on 18/05/2021.
//

import SwiftUI

struct ComingSoon: View {
    
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden = true
    
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject var viewModel = ComingSoonViewModel()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let baseline = scroll - 105
            let singleFrameSizeWithPadding: CGFloat = 410
            
            let active = Int(baseline / singleFrameSizeWithPadding) + 1
            
            activeIndex = Int(active)
            
        }
    }
    
    var body: some View {
        let movies = viewModel.movies.enumerated().map({ $0  })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: scrollOffset)
        }

            
        
        
        //NavigationView {
            return Group {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies), id: \.offset) { index, movie in
                                ComingSoonRow(movie: movie,
                                              movieDetailToShow: $movieDetailToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        Group {
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.7)
                                        }
                                        .animation(.easeInOut)
                                    )
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Text("notificaitons list"),
                        isActive: $showNotificationList,
                        label: {
                            EmptyView()
                        })
                        .navigationBarTitle("")
                        .navigationBarHidden(navBarHidden)
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                            self.navBarHidden = true
                        })
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                            self.navBarHidden = false
                        })
                }
            }
        //}
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
