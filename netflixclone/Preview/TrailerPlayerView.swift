//
//  TrailerPlayerView.swift
//  netflixclone
//
//  Created by ed on 20/05/2021.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var videoUrl: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoUrl != nil {
            VideoPlayer(url: videoUrl!, play: $playVideo)
        } else {
            Text("Could not load video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoUrl: nil, playVideo: .constant(true))
    }
}
