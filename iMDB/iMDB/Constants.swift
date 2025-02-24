//
//  Constants.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import Foundation

class Constants {
    //Do not share this values to the public. Avoid pushing to repo.
    static let APIKey = ""
    static let authToken = ""
    
    //This is safe
    static let popularMoviesURL = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"
    static let postersURL = "https://image.tmdb.org/t/p/original"
}
