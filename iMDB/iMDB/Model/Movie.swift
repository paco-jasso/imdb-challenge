//
//  Movie.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import Foundation

struct PopularMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let title: String
    let posterPath: String
    let genres: [Int]
    let overview: String
    let release: String
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case posterPath = "poster_path"
        case genres = "genre_ids"
        case overview = "overview"
        case release = "release_date"
    }
}


