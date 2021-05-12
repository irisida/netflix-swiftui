//
//  GlobalHelpers.swift
//  netflixclone
//
//  Created by ed on 08/05/2021.
//

import Foundation

// video and images

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!
let exampleImageUrl1 = URL(string: "https://picsum.photos/322/122")!
let exampleImageUrl2 = URL(string: "https://picsum.photos/323/130")!
let exampleImageUrl3 = URL(string: "https://picsum.photos/319/125")!

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageUrl: randomExampleImageUrl)
let exampleTrailer2 = Trailer(name: "Holiday Special", videoURL: exampleVideoURL, thumbnailImageUrl: randomExampleImageUrl)
let exampleTrailer3 = Trailer(name: "Season 2 finale", videoURL: exampleVideoURL, thumbnailImageUrl: randomExampleImageUrl)

var randomExampleImageUrl: URL {
    return [exampleImageUrl1, exampleImageUrl2, exampleImageUrl3].randomElement() ?? exampleImageUrl3
}

let exampleTrailersGroup1 = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

// movies data

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "Dark",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: [],
                          promotionalText: "test", trailers: [])

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Lucifer",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: [], trailers: [])

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Coming 2 America",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: [], trailers: [])

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Hostel",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: [], trailers: [])

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Fight Club",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: [], trailers: [])

let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "Zero Dark Thirty",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: exampleMoviesGroup1,
                          promotionalText: "Dark and gritty gets darker", trailers: exampleTrailersGroup1)



var exampleMoviesGroup1: [Movie] {
    return [ exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5 ].shuffled()
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Everything to play for",
                                             description: "The team is faced with a dangerous challenge and trust is tested to the last degree. Andreas accepts a new mission after his diciplinary and Ian decides his time on the team should draw to a close.",
                                             season: 1,
                                             episode: 2)


