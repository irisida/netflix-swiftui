//
//  data.swift
//  netflixclone
//
//  Created by ed on 08/05/2021.
//

import Foundation

// ****************************************
// video and images
// ****************************************

let exampleVideoURL1 = URL(string: "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4")!
let exampleImageUrl1 = URL(string: "https://picsum.photos/299/122")!
let exampleImageUrl2 = URL(string: "https://picsum.photos/299/130")!
let exampleImageUrl3 = URL(string: "https://picsum.photos/299/125")!

var randomExampleImageUrl: URL {
    return [exampleImageUrl1, exampleImageUrl2, exampleImageUrl3].randomElement() ?? exampleImageUrl3
}

// ****************************************
// Trailers
// ****************************************

let exampleTrailer1 = Trailer(name: "Season 2 finale", videoURL: exampleVideoURL1, thumbnailImageUrl: randomExampleImageUrl)
let exampleTrailer2 = Trailer(name: "Season 3 preview", videoURL: exampleVideoURL1, thumbnailImageUrl: randomExampleImageUrl)
let exampleTrailer3 = Trailer(name: "The last waltz", videoURL: exampleVideoURL1, thumbnailImageUrl: randomExampleImageUrl)

let exampleTrailersGroup1 = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

// ****************************************
// movie data
// ****************************************

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "Dark",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian", "Suspenseful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: moreLikeThisExamples,
                          episodes: allExampleEpisodes,
                          promotionalText: "There's dark, then darker than dark.",
                          trailers: exampleTrailersGroup1,
                          previewImageName: "ozarkPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Lucifer",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Action", "Space", "Horror"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: moreLikeThisExamples,
                          promotionalText: "The devil made him do it",
                          trailers: exampleTrailersGroup1,
                          previewImageName: "ozarkPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Coming 2 America",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Comedy"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: moreLikeThisExamples,
                          promotionalText: "The Prince of Zamunda becomes a King",
                          trailers: exampleTrailersGroup1,
                          previewImageName: "arrestedDevPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Hostel",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Gritty", "Film Noir"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: moreLikeThisExamples,
                          promotionalText: "Some getaways are unforgettable",
                          trailers: exampleTrailersGroup1,
                          previewImageName: "arrestedDevPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Fight Club",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Action", "Leaving soon"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: moreLikeThisExamples,
                          episodes: allExampleEpisodes,
                          promotionalText: "If it's your first night. You have to fight!",
                          trailers:exampleTrailersGroup1,
                          previewImageName: "dirtyJohnPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "Zero Dark Thirty",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["War", "Drama", "IMDB"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3 ,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: moreLikeThisExamples,
                          episodes: allExampleEpisodes,
                          promotionalText: "The war on terror as no rules.",
                          trailers: exampleTrailersGroup1,
                          previewImageName: "dirtyJohnPreview",
                          previewVideoUrl: exampleVideoURL1)

// more like this exampe movie data
let exampleMovie7 = Movie(id: UUID().uuidString,
                          name: "Zero Dark Thirty",
                          thumbnailURL: URL(string: "https://picsum.photos/219/305")!,
                          categories: ["War", "Drama", "IMDB"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3 ,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: [],
                          episodes: allExampleEpisodes,
                          promotionalText: "The war on terror as no rules.",
                          trailers: exampleTrailersGroup1,
                          previewImageName: "darkPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie8 = Movie(id: UUID().uuidString,
                          name: "Fight Club",
                          thumbnailURL: URL(string: "https://picsum.photos/219/304")!,
                          categories: ["Action", "Leaving soon"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "ITN",
                          cast: "Jan Leeming, Trevor Mcdonald, Leonard Parkin",
                          moreLikeThisMovies: [],
                          episodes: allExampleEpisodes,
                          trailers: [],
                          previewImageName: "darkPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie9 = Movie(id: UUID().uuidString,
                          name: "Coming 2 America",
                          thumbnailURL: URL(string: "https://picsum.photos/219/302")!,
                          categories: ["Comedy"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: [],
                          trailers: exampleTrailersGroup1,
                          previewImageName: "whiteLinesPreview",
                          previewVideoUrl: exampleVideoURL1)

let exampleMovie10 = Movie(id: UUID().uuidString,
                          name: "Hostel",
                          thumbnailURL: URL(string: "https://picsum.photos/219/303")!,
                          categories: ["Gritty", "Film Noir"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 1,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "",
                          cast: "",
                          moreLikeThisMovies: [],
                          trailers: [],
                          previewImageName: "whiteLinesPreview",
                          previewVideoUrl: exampleVideoURL1)


var moreLikeThisExamples: [Movie] {
    return [ exampleMovie7,exampleMovie8, exampleMovie9, exampleMovie10 ].shuffled()
}

var setupMoviesShuffled: [Movie] {
    return [ exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6 ].shuffled()
}

var previewMovies: [Movie] {
    return [ exampleMovie2, exampleMovie4, exampleMovie6, exampleMovie8, exampleMovie10 ].shuffled()
}

var topPromoMovies: [Movie] {
    return generateMovies(12)
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Everything to play for",
                                             description: "With the latinos believing Brin is dead he is forced to make a quiet escape and reach the captain. McArthur makes an attempt on the mayor and the captain exposing Kathy as the leak. She is taken to the FBI ops location to be debriefed on Tulo Loco.",
                                             season: 1,
                                             episode: 2)



// ****************************************
// Episodes
// ****************************************

let episode1 = Episode(name: "Beginning and Endings",
                       season: 1,
                       episodeNumber: 1,
                       thumbnailImageUrlString: "https://picsum.photos/210/308",
                       description: "Six monts after the disappearance of the team Brin makes contact",
                       length: 52,
                       videoUrl: exampleVideoURL1)

let episode2 = Episode(name: "Tough middles",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageUrlString: "https://picsum.photos/209/301",
                       description: "Eleven monts after the disappearance, two of the task force are dead. The captain hunts the leak and suspects Brin may be compromised.",
                       length: 52,
                       videoUrl: exampleVideoURL1)

let episode3 = Episode(name: "Lateral flow",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageUrlString: "https://picsum.photos/209/301",
                       description: "The day of reckoning comes for Jose and Brin. The captain and the FBI agents continue to fight over who leads the case. Brin is forced to make a choice.",
                       length: 54,
                       videoUrl: exampleVideoURL1)

let episode4 = Episode(name: "Jury's out",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageUrlString: "https://picsum.photos/211/302",
                       description: "Juror #7 finally talls of emily's abduction and identifies the original contact for McArthur, clearing Brin.",
                       length: 56,
                       videoUrl: exampleVideoURL1)

let episode5 = Episode(name: "Resurgance",
                       season: 2,
                       episodeNumber: 3,
                       thumbnailImageUrlString: "https://picsum.photos/209/304",
                       description: "The latino gang ambush Brin and set up Jose after paying off the guards",
                       length: 52,
                       videoUrl: exampleVideoURL1)

let episode6 = Episode(name: "Exodus",
                       season: 3,
                       episodeNumber: 1,
                       thumbnailImageUrlString: "https://picsum.photos/209/301",
                       description: "The gates close as the sound of a single bullet rings out in the courtyard. Can the agents save Sean from Tulo Loco in time to get the info Brin has found before McArthur and the latinos get to Brin a second time.",
                       length: 52,
                       videoUrl: exampleVideoURL1)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]
