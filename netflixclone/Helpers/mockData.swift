//
//  GlobalHelpers.swift
//  netflixclone
//
//  Created by ed on 08/05/2021.
//

import Foundation

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
                          promotionalText: "test")

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Lucifer",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "")

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Coming 2 America",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "")

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Hostel",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "")

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Fight Club",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin")

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
                          promotionalText: "Dark and gritty gets darker")


let exampleMovies1: [Movie] = [
    exampleMovie1,
    exampleMovie2,
    exampleMovie3,
    exampleMovie4,
    exampleMovie5,
    exampleMovie6,
]

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Everything to play for",
                                             description: "The team is faced with a dangerous challenge and trust is tested to the last degree. Andreas accepts a new mission after his diciplinary and Ian decides his time on the team should draw to a close.",
                                             season: 1,
                                             episode: 2)

let exampleEpisodeInfo2 = CurrentEpisodeInfo(episodeName: "Love and Hate",
                                             description: "The death of Arthur brings tensions to a head. The future of the team is decided when both try to settle the score with bullets",
                                             season: 2,
                                             episode: 4)
