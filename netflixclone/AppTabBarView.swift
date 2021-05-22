//
//  AppTabBarView.swift
//  netflixclone
//
//  Created by ed on 16/05/2021.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex: Int = 0
    
    @State private var previewCurrentPos: CGFloat = 1000
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                
                if previewHorizontalDragActive {
                    return
                }
                
                if previewCurrentPos == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        // we ae dragging horizontally
                        previewHorizontalDragActive = true
                        return
                        
                    }
                }
                
                // vertical only
                let shouldBePosition = value.translation.height + self.previewNewPos
                
                if shouldBePosition < 0 {
                    return
                } else {
                    self.previewCurrentPos = shouldBePosition
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                // vertical only
                let shouldBePosition = value.translation.height + self.previewNewPos
                
                if shouldBePosition < 0 {
                    self.previewCurrentPos = .zero
                    self.previewNewPos = .zero
                } else {
                    let closingPoint = screen.size.height * 0.25
                    
                    if shouldBePosition > closingPoint {
                        withAnimation {
                            self.showPreviewFullScreen = false
                            self.previewNewPos = .zero
                            self.previewCurrentPos = screen.height + 20
                        }
                    } else {
                        withAnimation {
                            self.previewNewPos = .zero
                            self.previewCurrentPos = .zero
                        }
                    }
                }
                
                previewHorizontalDragActive = false
            }
        
        return ZStack {
            TabView {
                HomeView(showPreviewFullScreen: $showPreviewFullScreen,
                         previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                
                ComingSoon()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }
                    .tag(2)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }
                    .tag(2)
                
                Text("More")
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
                    .tag(2)
            }
            .accentColor(.white)
            
            PreviewList(movies: previewMovies,
                        currentSelection: $previewStartingIndex,
                        isVisible: $showPreviewFullScreen,
                        externaDragGesture: previewDragGesture)
                .offset(y: previewCurrentPos)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                // show fullscreen
                withAnimation {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                }
            } else {
                // hiding
                withAnimation {
                    self.previewCurrentPos = screen.height + 20
                    self.previewNewPos = screen.height + 20
                }
            }
        })
        
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}
